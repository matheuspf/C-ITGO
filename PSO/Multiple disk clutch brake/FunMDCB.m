function z=FunMDCB(u)
 
%% Objective
%u= [70 90 1 910 3]; 
z=fobjMDCB(u);

% Apply nonlinear constraints by penalty method
% Z=f+sum_k=1^N lam_k g_k^2 *H(g_k) 
z=z+getnonlinearMDCB(u);
%% Objective functions
function z=fobjMDCB(u)
% Multiple Disk Clutch Brake design problem
%u= [70 90 1 910 3]; 

n = size(u,1);z = zeros(n,1);
for i = 1 : n
z(i)=7.8e-6*pi*(u(i,2)^2 - u(i,1)^2)*u(i,3)*(u(i,5)+1);
end

%%
function z=getnonlinearMDCB(u)

n = size(u,1);z = zeros(n,1);

% Penalty constatn
lam=10^15; lameq=10^15;
for i = 1 : n
 x = u(i,:);   
[g,geq]=constraintsMDCB(x);
Z = 0;
% Inequality constraints
for k=1:length(g)
    Z=Z+ lam*g(k)^2*getHM(g(k));
end
z(i) = Z;
end

% Equality constraints (when geq=[], length->0)
for k=1:length(geq)
   Z=Z+lameq*geq(k)^2*geteqHM(geq(k));
end
% Test if inequalities hold so as to get the value of the Index function
% H(g) which is something like Index functions as in interior-point methods
function H=getHM(g)
if g>=0 
    H=0; 
else
    H=1; 
end

% Test if equalities hold
function H=geteqHM(g)
if g==0
    H=0;
else
    H=1; 
end
%% All constraints
function [g,geq]=constraintsMDCB(x)

% Inequality constraints
%==============================
%x= [70 90 1 910 3]; 
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
%================================
% Equality constraints
geq=[];