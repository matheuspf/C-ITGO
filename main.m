addpath('C:\Users\Matheus\Documents\Matlab\MAT_ENG\Functions\CB');
addpath('C:\Users\Matheus\Documents\Matlab\MAT_ENG\Functions\CS');
addpath('C:\Users\Matheus\Documents\Matlab\MAT_ENG\Functions\GT');
addpath('C:\Users\Matheus\Documents\Matlab\MAT_ENG\Functions\PV');
addpath('C:\Users\Matheus\Documents\Matlab\MAT_ENG\Functions\SR');
addpath('C:\Users\Matheus\Documents\Matlab\MAT_ENG\Functions\TB');
addpath('C:\Users\Matheus\Documents\Matlab\MAT_ENG\Functions\WB');
addpath('C:\Users\Matheus\Documents\Matlab\MAT_ENG\Functions\RG');
addpath('C:\Users\Matheus\Documents\Matlab\MAT_ENG\Functions\SC');
addpath('C:\Users\Matheus\Documents\Matlab\MAT_ENG\Functions\HT');
addpath('C:\Users\Matheus\Documents\Matlab\MAT_ENG\Functions\MD');
addpath('C:\Users\Matheus\Documents\Matlab\MAT_ENG\Functions\TC');
addpath('C:\Users\Matheus\Documents\Matlab\MAT_ENG\Functions\SS');

format long

warning('off','all')



id = 'MD';

ffs = [];
iter = 25;

maxFEs = 5000;



popSizes = [20, 5];
K = [7, 2];
prob = 0.5;
phi = 0.7;

matR = dlmread('test5.txt');



%{

popSizes = int32([linspace(190, 210, 3); linspace(25, 35, 3)]'); 

K = int32([linspace(4, 6, 3); linspace(1, 3, 3)]');

prob = linspace(0.5, 0.6, 3)';

phi = linspace(0.2, 0.8, 3)';



results = zeros(size(popSizes, 1) * size(K, 1) * size(prob, 1) * size(phi, 1), 11);

pos = 1;

for i = 1:size(popSizes, 1)
	for j = 1:size(K, 1)
		for k = 1:size(prob, 1)
			for l = 1:size(phi, 1)



				[minF meanF maxF devF viol] = execute(id, popSizes(i, :), K(j, :), prob(k), phi(l), maxFEs, iter, matR);
				results(pos, :) = [popSizes(i, 1) popSizes(i, 2) K(j, 1) K(j, 2) prob(k) phi(l) minF meanF maxF devF viol];

				results(pos, 1) = popSizes(i, 1);
				results(pos, 2) = popSizes(i, 2);
				results(pos, 3) = K(j, 1);
				results(pos, 4) = K(j, 2);
				results(pos, 5) = prob(k);
				results(pos, 6) = phi(l);
				results(pos, 7) = minF;
				results(pos, 8) = meanF;
				results(pos, 9) = maxF;
				results(pos, 10) = devF;
				results(pos, 11) = viol;


				pos = pos + 1;

			end
		end
	end
end



fileID = fopen(strcat('/home/matheus/Algoritmos/MAT_TGO_ENG/Logs/', id, '.txt'), 'w');

for i = 1:size(results, 1)
	fprintf(fileID, '%d ', results(i, 1:4));
	fprintf(fileID, '%f ', results(i, 5:6));
	fprintf(fileID, '%0.15f ', results(i, 7:11));
	fprintf(fileID, '\n');
end

fclose(fileID);
%}


%{
x = [42 15 20 50];

func = Function(id);

[x ff vv] = LocalSearch(func, x, 1e2);

disp(x);


%[ff vv] = func.eval(x);

disp(sprintf('%0.15e', ff));

return;
%}




[minF meanF maxF devF viol mFEs] = execute(id, popSizes, K, prob, phi, maxFEs, iter, matR);
