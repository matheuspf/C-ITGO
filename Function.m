classdef Function < handle
	
	properties

		func
		
		N
		numIneqs
		numEqs

		lBound
		uBound

		fName

		FEs


		params
		fitness
		constraints
		optimal

		maxFEs

		xtype


		fileID

		funcIter

		best

		id

	end


	methods



		function [ff vv] = funcLog(obj, x)
			
			ff = funcs(x);
			%ff = obj.func(x);


			if nargout > 1

				[g h] = obj.constraints(x);

				g = max(g, 0.0);
				h = abs(h).* (abs(h) > 1e-4);

				vv = sum(g) + sum(h);
			end
		
			
			obj.FEs = obj.FEs + 1;

			if obj.FEs >= obj.maxFEs
				throw(causeException);
			end
		end

		function [ff gg] = funcGrad(obj, x)

			[ff, gg] = funcs(x);

			obj.FEs = obj.FEs + 1;

			if obj.FEs >= obj.maxFEs
				throw(causeException);
			end
		end



		function obj = Function(id)

			[obj.params obj.func obj.constraints obj.numIneqs obj.numEqs] = FunctionMap(id);

			obj.fitness = @(x) obj.funcLog(x);

			[A b Aeq beq obj.lBound obj.uBound obj.xtype] = obj.params();

			obj.N = length(obj.lBound);

			obj.FEs = 0;

			obj.id = id;

		end


		function [ff vv] = eval(obj, x)
			
			if size(x, 2) > size(x, 1)
				x = x';
			end

			[ff vv] = obj.funcLog(x);
		end

	end
end