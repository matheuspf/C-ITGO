function [x ff vv] = LocalSearch(func, x0, iter)


Opt = [];

fitness = @(x) func.funcLog(x);

%opts = optiset('display', 'off', 'maxfeval', iter, 'maxtime', 1e16);
opts = optiset('display', 'off', 'maxfeval', iter, 'maxtime', 1e16, 'solver', 'nomad');

if func.numIneqs == 0

	Opt = opti('fun', fitness, 'bounds', func.lBound, func.uBound, 'xtype', func.xtype, 'options', opts);

else

	nlcon = @(x) func.constraints(x);
	%nlcon = @(x) PV_R_2(x);
	%nlcon = @(x) SR_R_2(x);
	%nlcon = @(x) SS_R_2(x);

	nlrhs = zeros(func.numIneqs, 1);
	nle = -ones(func.numIneqs, 1);

	Opt = opti('fun', fitness, 'nlmix', nlcon, nlrhs, nle, 'ineq', [], [], ...
			   'bounds', func.lBound, func.uBound, 'xtype', func.xtype, 'options', opts);

end



[x, fval, exitflag, output] = solve(Opt, x0);

x = round(x);
%x(1:2) = round(x(1:2));
%x(3) = round(x(3));


[ff vv] = func.eval(x);


end