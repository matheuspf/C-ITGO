function [x ff vv] = LocalSearch_Unc(func, x0, iter)



options = optimoptions('fminunc', 'Display', 'off', 'Algorithm', 'quasi-newton', 'MaxIterations', 1e4, ...
					   'MaxFunctionEvaluations', iter, 'SpecifyObjectiveGradient', true, ...
					   'OptimalityTolerance', 1e-7, 'StepTolerance', 1e-7);

%options = optimoptions('patternsearch', 'Display', 'off', 'MaxIterations', 1e4, 'MaxFunctionEvaluations', iter);


if size(x0, 1) < size(x0, 2)
	x0 = x0';
end




objFunc = @(x) func.funcGrad(x);


%disp('X:');
%disp(x0');


[x, fval, exitflag, output] = fminunc(objFunc, x0, options);

%[A, b, Aeq, beq, lb, ub, xtype] = func.params();
%[x, fval, exitflag, output] = patternsearch(objFunc, x0, A, b, Aeq, beq, lb, ub, options);



%disp(x');


[ff vv] = func.eval(x');

end