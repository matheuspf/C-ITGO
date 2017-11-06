function [g h] = MD_R(x)


x(3) = 1.0 + (round(x(3)) / 2.0);
x(4) = 600.0 + (round(x(4)) * 10.0);



g = zeros(8, 1);


h = [];

%h = zeros(5, 1);

%{

Ms = 40;
Mf = 3;
n = 250;
Iz = 55;
s = 1.5;
Tmax = 15;
Vsrmax = 10;
delta = 0.5;
rho = 0.0000078;
mu = 0.5;
pmax = 1;
deltaR = 20;
Lmax = 30;

Rsr = (2.0 / 3) * ((x(2)^3 - x(1)^3) / (x(2)^2 - x(1)^2));

Vsr = (pi * Rsr * n) / 30;

A = pi * (x(2)^2 - x(1)^2);

prz = x(4) / A;

w = (pi * n) / 30;

Mh = (2 / 3.0) * mu * x(4) * x(5) * ((x(2)^3 - x(1)^3) / (x(2)^2 - x(1)^2));

T = (Iz * pi * n) / (30 * (Mh - Mf));



g(1) = x(2) - x(1) - deltaR;

g(2) = Lmax - (x(5) + 1) * (x(3) + delta);

g(3) = pmax - prz;

g(4) = pmax * Vsrmax - prz * Vsr;

g(5) = Vsrmax - Vsr;

g(6) = Tmax - T;

g(7) = Mh - s * Ms;

g(8) = T;




g = -g;

%}


%x = round(x);


%h = [abs(x - round(x))];



delta_r =20;
lmax = 30;
Pmax = 1;
Vsrmax = 10;
n = 250;
Iz = 55;
Tmax = 15;
s = 1.5;
mu = 0.5;
Ms = 40*1e3; Mf = 3*1e3;
Prz = x(4)/(pi*(x(2)^2-x(1)^2));
Rsr = (2/3)*((x(2)^3-x(1)^3))/((x(2)^2-x(1)^2));
Vsr = 1e-3*pi*n*Rsr/30;
Mh = (2/3)*mu*x(4)*x(5)*((x(2)^3-x(1)^3))/((x(2)^2-x(1)^2));
T = 1e3*Iz*pi*n/(30*(Mh - Mf));
g(1) = x(2) - x(1) - delta_r;
g(2) = lmax - (x(5)+1)*(x(3)+0.5);
g(3) = Pmax - Prz;
g(4) = Pmax*Vsrmax - Prz*Vsr;
g(5) = Vsrmax - Vsr;
g(6) = Tmax - T;
g(7) = 1e-3*(Mh - s*Ms);
g(8) = T;


g = -g;



end