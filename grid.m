addpath('/home/matheus/Algoritmos/ITGO_ENG/Functions/GKLS');

format long

warning('off','all')



matR = dlmread('test4.txt');

id = 'GKLS';

iter = 10;

maxFEs = 100000;

alphaVal = 1e-7;


% [P_1, P_2, K_1, K_2, phi]

parameters = [[10, 3, 3, 1, 0.1]; [10, 2, 3, 1, 0.1]; [10, 2, 2, 1, 0.1]; [20, 3, 4, 1, 0.1];...
              [20, 5, 4, 2, 0.1]; [20, 2, 2, 1, 0.1]; [50, 5, 5, 2, 0.1]; [50, 3, 10, 1, 0.1]];



for i = 1:size(parameters, 1)

    popSizes = int32(parameters(i, 1:2));
    K = int32(parameters(i, 3:4));
    phi = parameters(i, 5);
    prob = 0.5;


    norms = [];
    fes = [];
    solved = 0;


    rng(270001, 'twister');

    disp(sprintf('Params:  PS: [%d, %d]       K: [%d, %d]      P: %f      phi: %f \n\n', ...
			      popSizes(1), popSizes(2), K(1), K(2), prob, phi));


    for j = 1:iter

    	funcs(j);
	    xVal = funcs();

        posR = int32(rand(1, 1) * size(matR, 1));

        func = Function(id);

	    tgo = I_TGO(func, popSizes, K, prob, phi, maxFEs, matR, posR, xVal);

        try
		    tgo.exec();
        catch causeException
            %disp(causeException);
        end


        if tgo.func.FEs < 16000
            solved = solved + 1;
        end

        norms = [norms norm(tgo.best - xVal)];
        fes = [fes tgo.func.FEs];

        disp(sprintf('run:  %d     fes: %d     norm: %0.15e\n', j, fes(j), norms(j)))
    end

    disp(sprintf('\n\n'));


    fileID = fopen(strcat('/home/matheus/Algoritmos/ITGO_ENG/Logs/run_', int2str(i), '.txt'), 'w');

    fprintf(fileID, 'Solved: %d\n\nPop: [%d, %d]    K: [%d, %d]    phi: %f    prob: %f \n\n\n', ...
                     solved, popSizes(1), popSizes(2), K(1), K(2), phi, prob);

    for j = 1:iter
        fprintf(fileID, 'run:  %d     fes: %d     norm: %0.15e\n', j, fes(j), norms(j));
    end

    fclose(fileID);

end