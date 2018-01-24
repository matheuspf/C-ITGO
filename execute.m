function [minF, meanF, maxF, devF, viol, mFEs] = execute(id, popSizes, K, prob, phi, maxFEs, iter, matR)


ffs = [];
fes = [];
viol = 0;


posR = 0;

%disp(sprintf('Function:  %s    Iteration:  %d \n\n', func.id, i));

bestF = 1e20;
best = [];


rng(270001, 'twister');


disp(sprintf('Params:  PS: [%d, %d]       K: [%d, %d]      P: %f      phi: %f \n\n', ...
			  popSizes(1), popSizes(2), K(1), K(2), prob, phi));

for i = 1:iter

	funcs(i);	

	xVal = funcs();


	%rng(270000 + i, 'twister');
	%rng(270001, 'twister');

	posR = int32(rand(1, 1) * size(matR, 1));
	

	func = Function(id);

	tgo = I_TGO(func, popSizes, K, prob, phi, maxFEs, matR, posR, xVal);

	try
		tgo.exec();
	catch causeException
	end

	

	x = tgo.best;
	ff = tgo.bestF;
	vv = tgo.bestV;
	FEs = tgo.func.FEs;

	viol = viol + vv;

	ffs = [ffs ff];
	fes = [fes FEs];


	if ff < bestF
		bestF = ff;
		best = x;
	end


	%disp(x);
	%disp(xVal);
	%disp(sprintf('\nIter:  %d         norm:   %.15e        Best F:  %0.15e      best V:  %0.15e          FEs:  %d \n\n\n\n', i, norm(x - xVal), ff, vv, func.FEs));
	disp(sprintf('\nIter:  %d         norm:   %.15e         FEs:  %d \n\n\n\n', i, norm(x - xVal), func.FEs));
end



minF = min(ffs);
meanF = mean(ffs);
maxF = max(ffs);
devF = std(ffs);

mFEs = mean(fes);



% disp(sprintf('MEAN:  %0.15e \n\n MIN:  %0.15e \n\n MAX:  %0.15e \n\n DEV: %0.15e \n\n VIOL:  %0.15e \n\n FEs:  %0.2f \n\n\n', meanF, minF, maxF, devF, viol, mFEs));


func = Function(id);

[bestG bestH] = func.constraints(best);



% disp(sprintf('Best info: \n\n'));
% disp(sprintf('f:   %.20e \n', bestF));
% disp(sprintf('x:   %.20e \n', best));
% disp(sprintf('g:  %.20e \n', bestG));


end