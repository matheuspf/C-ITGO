function [gg h] = HT_R(x)

h = [];
gg = zeros(7, 1);



R = x(1);
R0 = x(2);
Q = x(3);
mu = x(4);



N = 750.0;
g = 386.4;
hmin = 0.001;
Tmax = 50.0;
Ws = 101000.0;
Pmax = 1000.0;
C1 = 10.04;
n = -3.55;
C = 0.5;
gam = 0.0307;



P = (log10(log10(8.122e6 * mu + 0.8)) - C1) / n;

T = 2 * (10^P - 560);

Ef = 9336 * Q * gam * C * T;

h = (((2 * pi * N) / 60)^2) * ((2 * pi * mu) / Ef) * (((R^4) / 4) - ((R0^4) / 4));

P0 = ((6 * mu * Q) / (pi * h^3)) * log(R / R0);

W = ((pi * P0) / 2) * ((R^2 - R0^2) / (log(R / R0)));



gg(1) = -(W - Ws);

gg(2) = -(Pmax - P0);

gg(3) = -(Tmax - T);

gg(4) = -(h - hmin);

gg(5) = -(R - R0);

gg(6) = -(0.001 - (gam / (g * P0)) * (Q / (2 * pi * R * h)));

gg(7) = -(5000 - W / (pi * (R^2 - R0^2)));


end