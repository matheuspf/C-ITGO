function [g h] = SR_R(x)

h = [];

h = [abs(x(3) - round(x(3)))];

g = zeros(11, 1);

%x(3) = round(x(3));



%{
g(1) = 27 / (x(1) * x(2)^2 * x(3)) - 1;

g(2) = 397.5 / (x(1) * x(2)^2 * x(3)^2) - 1;

g(3) = (1.93 * x(4)^3) / (x(2) * x(3) * x(6)^4) - 1;

g(4) = (1.93 * x(5)^3) / (x(2) * x(3) * x(7)^4) - 1;

g(5) = (1.0 / (110.0 * x(6)^3)) * sqrt(((745 * x(4)) / (x(2) * x(3)))^2 + 16.9 * 1e6) - 1;

g(6) = (1.0 / (85.0 * x(7)^3)) * sqrt(((745 * x(5)) / (x(2) * x(3)))^2 + 157.5 * 1e6) - 1;

g(7) = (x(2) * x(3)) / 40 - 1;

g(8) = (5 * x(2)) / x(1) - 1;

g(9) = x(1) / (12 * x(2)) - 1;

g(10) = (1.5 * x(6) + 1.9) / x(4) - 1;

g(11) = (1.1 * x(7) + 1.9) / x(5) - 1;
%}


g(1) = 27/(x(1)*x(2)^2*x(3))-1;
g(2) = 397.50/(x(1)*x(2)^2*x(3)^2)-1;
g(3) = (1.93*x(4)^3)/(x(2)*x(3)*x(6)^4)-1;
g(4) = (1.93*x(5)^3)/(x(2)*x(3)*x(7)^4)-1;
g(5)= (1/(110*x(6)^3))*sqrt(((745*x(4))/(x(2)*x(3)))^2+16.9e6)-1;
g(6)= (1/(85*x(7)^3))*sqrt(((745*x(5))/(x(2)*x(3)))^2+157.5e6)-1;
g(7)=(x(2)*x(3))/40-1;
g(8)=((5*x(2))/x(1))-1;
g(9)=(x(1)/(12*x(2)))-1;
g(10)=((1.5*x(6)+1.9)/(x(4)))-1;
g(11)=(1.1*x(7)+1.9)/(x(5))-1;


end