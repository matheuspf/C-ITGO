addpath('/home/matheus/Algoritmos/MAT_TGO/cec2006')

format long


rng(270001, 'twister');



func = Function(17);


ploting = 0;


%[X,Y] = meshgrid(:0.5:10,1:20);
%Z = sin(X) + cos(Y);
%surf(X,Y,Z)


if ploting == 1

	x0 = [201.784467214523659, 99.9999999999999005, 383.071034852773266, 420, -10.9076584514292652, 0.0731482312084287128];


	st = 4;

	x = 201.784467214523659-1e-2:1e-3:201.784467214523659+1e-2;
	y = 383.071034852773266-1e-2:1e-3:383.071034852773266+1e-2;

	z = zeros(21);
	w = zeros(21);

	for i=1:21
		for j=1:21

			x0(1) = x(i);
			x0(3) = y(j);

			[z(i, j) w(i, j)] = func.eval(x0);

		end
	end


	xlabel('x1');
	ylabel('x3');

	%surf(x, y, z);
	%axis([min(x) max(x) min(y) max(y) min(min(z)) max(max(z))]);
	surf(x, y, w);
	axis([min(x) max(x) min(y) max(y) min(min(w)) max(max(w))]);



elseif ploting == 2


	x0 = [201.784467214523659, 99.9999999999999005, 383.071034852773266, 420, -10.9076584514292652, 0.0731482312084287128];


	id = 6;

	%x = 383.0652570613970-1e-2:1e-4:383.071034852773266+1e-2;
	x = x0(id)-1e-2:1e-4:x0(id)+1e-2;

	y = [];

	disp(size(x));

	for i=x

		x0(id) = i;

		[ff vv] = func.eval(x0);

		y = [y vv];

	end

	disp(min(y));
	disp(max(y));

	plot(x, y);
	axis([min(x) max(x) min(y)-1e-8 max(y)+1e-8]);



else


	%x0 = [201.784467214523659, 99.9999999999999005, 383.071034852773266, 420, -10.9076584514292652, 0.0731482312084287128];

	x0 = [201.784467214523659, 99.9999999999999005, 383.070034852773266, 420, 0.0731482312084287128];

	%x0 = [201.784567214523659, 99.9999999999999005, 383.071034852773266, 420, 0.0731482312084287128];

	%x0 = [-1e-4    -1e-4   383.071034852773266   420  0.0  0.0731482312084287128];


	%x = x0;
	%[ff vv] = func.eval(x0);

	[x ff vv] = LocalSearchPat(func, x0, 1e2, 'iter');


	disp(x0);
	%disp(x');
	disp(sprintf('\n%0.15f     %0.15f    %0.15f \n\n', ff, vv, abs(ff - func.optimal)));

end

