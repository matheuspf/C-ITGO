% d-dimensional objective function
function z=FunWeldedBeam(u)
 %v0 = [0.205730 3.470489  9.036624 0.205729];
% Objective
z=fobj(u);

% Apply nonlinear constraints by penalty method
% Z=f+sum_k=1^N lam_k g_k^2 *H(g_k) 
z=z+getnonlinear(u);

% Objective functions
function z=fobj(u)
% Welded Beam Design Optimization
% K. Ragsdell and D. Phillips, Optimal design of a class of welded
% strucures using geometric programming, 
% J. Eng. Ind., 98 (3):1021-1025, (1976).
% Best solution found in literature 
% [0.205730, 3.470489, 9.036624, 0.205729) with the objective 1.724852
% by Cagnina et al., Solving engineering optimization problems with the
% simple constrained particle swarm optimizer, Informatica, 32 (2008)319-326 
n = size(u,1);z = zeros(n,1);
for i = 1 : n
z(i)=1.10471*u(i,1)^2*u(i,2)+0.04811*u(i,3)*u(i,4)*(14.0+u(i,2));
end


function z=getnonlinear(u)
n = size(u,1);z = zeros(n,1);
%v0 = [0.205730 3.470489  9.036624 0.205729];
% Penalty constatn
lam=10^15; lameq=10^15;
for i = 1 : n
 x = u(i,:);   
[g,geq]=constraints_Welded_Beam(x);
Z = 0;
% Inequality constraints
for k=1:length(g)
    Z=Z+ lam*g(k)^2*getH(g(k));
end
z(i) = Z;
end

% Equality constraints (when geq=[], length->0)
for k=1:length(geq)
   Z=Z+lameq*geq(k)^2*geteqH(geq(k));
end

% All constraints
function [g,geq]=constraints_Welded_Beam(x)

% Inequality constraints
Q=6000*(14+x(2)/2);
D=sqrt(x(2)^2/4+(x(1)+x(3))^2/4);
J=2*(x(1)*x(2)*sqrt(2)*(x(2)^2/12+(x(1)+x(3))^2/4));
alpha=6000/(sqrt(2)*x(1)*x(2));
beta=Q*D/J;
tau=sqrt(alpha^2+2*alpha*beta*x(2)/(2*D)+beta^2);
sigma=504000/(x(4)*x(3)^2);
delta=65856000/(30*10^6*x(4)*x(3)^3);
F=4.013*(30*10^6)/196*sqrt(x(3)^2*x(4)^6/36)*(1-x(3)*sqrt(30/48)/28);

g(1)=tau-13600;
g(2)=sigma-30000;
g(3)=x(1)-x(4);
g(4)=0.10471*x(1)^2+0.04811*x(3)*x(4)*(14+x(2))-5.0;
g(5)=0.125-x(1);
g(6)=delta-0.25;
g(7)=6000-F;

% Equality constraints
geq=[];
% Test if equalities hold
function H=geteqH(geq)
if geq==0
    H=0;
else
    H=1; 
end
% Test if inequalities hold
function H=getH(g)
if g<=0 
    H=0; 
else
    H=1; 
end
