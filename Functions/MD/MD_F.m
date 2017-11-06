function f = MD_F(x)


%rho = 0.0000078;

%f = pi * (x(2)^2 - x(1)^2) * x(3) * (x(5) + 1) * rho;


%x = round(x);


x(3) = 1.0 + (round(x(3)) / 2.0);
x(4) = 600.0 + (round(x(4)) * 10.0);


f = 7.8e-6*pi*(x(2)^2 - x(1)^2)*x(3)*(x(5)+1);

%for i = 1:length(x)
%	f = f + (4 * (x(i) - floor(x(i))) * (1.0 - x(i) + floor(x(i))))^2;
%end

end