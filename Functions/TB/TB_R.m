function [g h] = TB_R(x)

h = [];
g = zeros(3, 1);

l = 100.0;
P = 2.0;
sig = 2.0;


g(1) = ((sqrt(2) * x(1) + x(2)) / (sqrt(2) * x(1)^2 + 2 * x(1) * x(2))) * P - sig;

g(2) = (x(2) / (sqrt(2) * x(1)^2 + 2 * x(1) * x(2))) * P - sig;

g(3) = (1.0 / (x(1) + sqrt(2) * x(2))) * P - sig;


end