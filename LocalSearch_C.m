function [x ff vv] = LocalSearch_C(func, x0, iter)


options = optimoptions('fmincon', 'FiniteDifferenceType', 'central', 'Display', 'off', ... %'ObjectiveLimit', func.best, ...
					   'Algorithm', 'sqp', 'MaxIterations', 1e5, 'ConstraintTolerance', 1e-16, ...
					   'OptimalityTolerance', 1e-7, 'StepTolerance', 1e-7, 'MaxFunctionEvaluations', iter, ...
					   'SpecifyObjectiveGradient', true);
					   %'DiffMaxChange', 1e-8, 'DiffMinChange', 1e-10);%, 'SpecifyObjectiveGradient',true);

if size(x0, 1) < size(x0, 2)
	x0 = x0';
end


%objFunc = @(x) func.funcLog(x);
objFunc = @(x) func.funcGrad(x);




[A, b, Aeq, beq, lb, ub, xtype] = func.params();

[x, fval, exitflag, output] = fmincon(objFunc, x0, A, b, Aeq, beq, lb, ub, func.constraints, options);

%x(3) = round(x(3));

%func.FEs = func.FEs + output.funcCount;


[ff vv] = func.eval(x);

end