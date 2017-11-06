function [g h] = CS_R(x)

h = [];
g = zeros(4, 1);


g(1) = 1 - (x(2)^3*x(3)) / (7.178*x(1)^4);

g(2) = (4*x(2)^2 - x(1)*x(2)) / (12566*(x(2)*x(1)^3) -x(1)^4) + 1.0 / (5108*x(1)^2) - 1.0;

g(3) = 1 - 140.45*x(1) / (x(2)^2*x(3));

g(4) = (x(2) + x(1)) / 1.5 - 1.0;



end