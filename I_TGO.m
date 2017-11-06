classdef I_TGO < handle

	properties

		func

		N
		K
		popSizes

		phi
		prob
		maxIter
		gens
		mu
		Eps

		populations


		best
		bestF
		bestV


		Qs
		Qc
		Ps
		Ri

		Ks


		posR

		matR

		maxFEs


	end

	methods

		function obj = I_TGO(func, popSizes, K, prob, phi, maxFEs, matR, posR)

			if nargin < 8
				posR = 1;
			end

			obj.matR = matR;

			%obj.matR = obj.matR(randperm(length(obj.matR)), :);

			obj.posR = posR;



			obj.func = func;

			obj.func.maxFEs = maxFEs;

			obj.N = obj.func.N;

			obj.popSizes = popSizes;

			obj.K = K;

			obj.prob = prob;

			obj.phi = phi * ones(obj.N, 1);

			obj.maxFEs = maxFEs;


			

			obj.maxIter = 1e5;

			obj.gens = length(obj.popSizes);

			obj.best = Vector(obj.N);
			obj.bestF = 1e19;
			obj.bestV = 1e19;

			obj.populations = {};

			obj.Ri = 5;


		end


		function initialize(obj)

			pop = Population(0, 0, obj.func.lBound, obj.func.uBound);

			obj.populations = { pop };

			pop.mat = zeros(obj.popSizes(1), obj.N);

			for i = 1:obj.popSizes(1)

				%pop.push_back(pop.lBound + rand(obj.N, 1).* (pop.uBound - pop.lBound), obj.func, i);


				pop.push_back(pop.lBound + obj.matR(obj.posR, :)'.* (pop.uBound - pop.lBound), obj.func, i);
				obj.posR = mod(obj.posR + 1, size(obj.matR, 1));


				%{
				newElem = zeros(obj.N, 1);

				for j = 1:obj.func.N
					newElem(j) = randi([pop.lBound(j) pop.uBound(j)], 1, 1);
				end

				pop.push_back(newElem, obj.func, i);
				%}
			end

		end



		function pop = createPop(obj, x, popS, lBound, uBound)

			if(size(x, 2) > size(x, 1))
				x = x';
			end

			pop = Population(popS, obj.N, max(obj.func.lBound, x - (0.5 * obj.phi).* (uBound - lBound)), ...;
									      min(obj.func.uBound, x + (0.5 * obj.phi).* (uBound - lBound)));

			pop.push_back(x, obj.func, 1);

			for i = 2:popS

				%pop.push_back(pop.lBound + rand(obj.N, 1).* (pop.uBound - pop.lBound), obj.func, i);


				pop.push_back(pop.lBound + obj.matR(obj.posR, :)'.* (pop.uBound - pop.lBound), obj.func, i);
				obj.posR = mod(obj.posR + 1, size(obj.matR, 1));



				%{
				newElem = zeros(obj.N, 1);

				for j = 1:obj.func.N
					%disp([pop.lBound(j) pop.uBound(j)]);
					newElem(j) = randi([pop.lBound(j) pop.uBound(j)], 1, 1);
				end

				pop.push_back(newElem, obj.func, i);
				%}
			end
		end


		function r = converged(obj, ff, vv)
			r = obj.func.FEs >= obj.maxFEs;


			%TB
			%r = (obj.bestV == 0.0) && (abs(obj.bestF - 263.895843) < 1e-5);

			%TC
			%r = (obj.bestV == 0.0) && (abs(obj.bestF - 0.01266523) < 1e-6);

			%SR
			%r = (obj.bestV == 0.0) && (abs(obj.bestF - 2996.34816497) < 1e-8);

			%WB
			%r = (obj.bestV == 0.0) && (abs(obj.bestF - 1.7248523) < 1e-6);

			%SS
			%r = (obj.bestV == 0.0) && (abs(obj.bestF - 2994.4710661) < 1e-7);

			%PV
			%r = (obj.bestV == 0.0) && (abs(obj.bestF - 6059.71433) < 1e-4);

			%PV2
			%r = (obj.bestV == 0.0) && (abs(obj.bestF - 5885.33277) < 1e-4);

			%MD
			r = (obj.bestV == 0.0) && (abs(obj.bestF - 0.313656) < 1e-5);

			%GT
			%r = (obj.bestV == 0.0) && (obj.bestF < 1e-10);
		end


		function b = isBest(obj, f1, v1, f2, v2)

			if (v1 == 0.0) && (v2 == 0.0)
				b = f1 < f2;
				return
			end

			if (v1 == 0.0)
				b = true;
				return
			end

			if (v2 == 0.0)
				b = false;
				return
			end

			b = v1 < v2;
		end


		function [x f v] = bestOf(obj, x1, f1, v1, x2, f2, v2)
			if obj.isBest(f1, v1, f2, v2) == true
				x = x1;
				f = f1;
				v = v1;
			else
				x = x2;
				f = f2;
				v = v2;
			end
		end



		function selectBest(obj, pop, K)

			M = size(pop.mat, 1);

			minX = pop.mat(1, :);
			minF = pop.fitness(1);
			minV = pop.violation(1);


			[kMat, knn] = pdist2(pop.mat, pop.mat, 'euclidean', 'Smallest', K+1);
			knn = knn';

   			rMat = triu(rand(M));
   			rMat = rMat + rMat';


			for i = 1:M

				b = true;


				for j = 2:(K+1)

					k = knn(i, j);

					if rMat(i, k) < obj.prob
						if pop.fitness(k) <= pop.fitness(i)
							b = false;
							break
						end
					else
						if obj.isBest(pop.fitness(k), pop.violation(k), pop.fitness(i), pop.violation(i))
							b = false;
							break;
						end
					end
				end


				if b == true
					pop.best = [pop.best; pop.mat(i, :)];
				end

				[minX minF minV] = obj.bestOf(minX, minF, minV, pop.mat(i, :), pop.fitness(i), pop.violation(i));
			end

			if size(pop.best, 1) == 0
				pop.best = [minX];
			end
		end




		function bestElems = sortBestElems(obj)

			bestElems = [];

			for i = 1:length(obj.populations)

				pop = obj.populations{i};

				for j = 1:size(pop.best, 1)

					[ff vv] = obj.func.eval(pop.best(j, :));

					bestElems = [bestElems; [vv ff pop.best(j, :)]];
				end
			end


			[~, inds] = sortrows(bestElems);

			bestElems = bestElems(inds, :);

			bestElems = bestElems(:, 3:end);
		end






		function [ret retF retV FEs] = exec(obj)

			for iter = 1:obj.maxIter

				tPts = 0;
				obj.initialize();

				for gen = 1:obj.gens

					newPops = {};

					for i = 1:length(obj.populations)

						pop = obj.populations{i};
						obj.selectBest(pop, obj.K(gen));


						if gen < obj.gens
							for j = 1:size(pop.best, 1)
								newPops{length(newPops)+1} = obj.createPop(pop.best(j, :)', obj.popSizes(gen+1), pop.lBound, pop.uBound);
							end

						else
							tPts = tPts + size(pop.best, 1);
						end
					end

					if gen < obj.gens
						obj.populations = newPops;
					end
				end



				bestElems = obj.sortBestElems();

				maxElem = 5;


				for i = 1:min(size(bestElems, 1), maxElem)

					[bestElems(i, :) ff vv] = LocalSearch(obj.func, bestElems(i, :), 100);

					if (obj.isBest(ff, vv, obj.bestF, obj.bestV) == true) || (ff < obj.bestF) %|| rand(1, 1) < 0.1

						if obj.isBest(ff, vv, obj.bestF, obj.bestV) == true
							obj.best = bestElems(i, :);
							obj.bestF = ff;
							obj.bestV = vv;
						end

					if obj.converged(obj.bestF, obj.bestV)
						ret = obj.best;
						retF = obj.bestF;
						retV = obj.bestV;
						FEs = obj.func.FEs;
						return
					end


						aux = [];

						[bestElems(i, :) ff vv] = LocalSearch(obj.func, bestElems(i, :), 200);
						
						[obj.best obj.bestF obj.bestV] = obj.bestOf(bestElems(i, :), ff, vv, obj.best, obj.bestF, obj.bestV);
					end

					if obj.converged(obj.bestF, obj.bestV)
						ret = obj.best;
						retF = obj.bestF;
						retV = obj.bestV;
						FEs = obj.func.FEs;
						return
					end
				end


				%[gg hh] = obj.func.constraints(obj.best);
				%disp(gg');

				%disp(obj.best);
				%disp(' ');
				disp(sprintf('%0.20e      %0.20e       %d \n\n', obj.bestF, obj.bestV, obj.func.FEs));

			end

			ret = obj.best;
			retF = obj.bestF;
			retV = obj.bestV;
			FEs = obj.func.FEs;
		end

	end
end