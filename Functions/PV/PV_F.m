function f = PV_F(x)

%x(1) = 0.0625 * round(x(1));
%x(2) = 0.0625 * round(x(2));

%x(1) = 0.0625 * x(1);
%x(2) = 0.0625 * x(2);


%f = 0.6224*x(1)*x(3)*x(4) + 1.7781*x(2)*(x(3)*x(3)) + 3.1661*(x(1)*x(1))*x(4) + 19.84*(x(1)*x(1))*x(3);

%{

if nargout > 1
	g = zeros(size(x));

	g(1) = 0.0625*(0.6224*x(3)*x(4) + 2*3.1661*x(1)*x(4) + 2*19.84*x(1)*x(3));
	g(2) = 0.0625*(1.7781*x(3)*x(3));
	g(3) = 0.6224*x(1)*x(4) + 2*1.7781*x(2)*x(3) + 19.84*x(1)*x(1);
	g(4) = 0.6224*x(1)*x(3) + 3.1661*x(1)*x(1);
end
%}


x(1) = 0.0625 * x(1);
x(2) = 0.0625 * x(2);

%x(1) = 0.0625 * round(x(1));
%x(2) = 0.0625 * round(x(2));

f = 0.6224*x(1)*x(3)*x(4)+1.7781*x(2)*x(3)^2+3.1661*x(1)^2*x(4)+19.84*x(1)^2*x(3);



end