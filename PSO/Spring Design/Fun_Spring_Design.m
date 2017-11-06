
%% Objective
function z=Fun_Spring_Design(xn)

z=cost_Spring_Design(xn);

% Apply nonlinear constraints by penalty method
% Z=f+sum_k=1^N lam_k g_k^2 *H(g_k) where lam_k >> 1 
z=z+getnonlinear(xn);
%% Cost or Objective function
 function z=cost_Spring_Design(xn)
 [ll,~] = size(xn);
 z = zeros(ll,1);
 for i = 1 : ll
     x = xn(i,:);
    z(i)=(2+x(3))*x(1)^2*x(2);
 end
 %%
function Z=getnonlinear(xn)
[ll,~] = size(xn);
Z=zeros(ll,1);
% Penalty constant >> 1
lam=10^15; lameq=10^15;
% Get nonlinear constraints
[G,geq]=constraint_Spring_Design(xn);

for i = 1 : ll
    g = G(i,:);
    % Apply all inequality constraints as a penalty function 
    for k=1:length(g)
        Z(i)=Z(i)+ lam*g(k)^2*getH(g(k));
    end
    % Apply all equality constraints (when geq=[], length->0)
    for k=1:length(geq)
       Z(i)=Z(i)+lameq*geq(k)^2*geteqH(geq(k));
    end
end
%%
function [g,geq]=constraint_Spring_Design(xn)
% All nonlinear inequality constraints should be here
% If no inequality constraint at all, simple use g=[];
% Note: there was some typo in Cagnina et al.'s paper, as the bracket near
% 12566 ( ) was misplaced in g(2), a factor 7178 instead of 71785 in g(1) 
[ll,~] = size(xn);
g = zeros(ll,4);
for i = 1 : ll
    x = xn(i,:);
    g(i,1)=1-x(2)^3*x(3)/(71785*x(1)^4);
    g(i,2)=(4*x(2)^2-x(1)*x(2))/(12566*(x(2)*x(1)^3-x(1)^4))+1/(5108*x(1)^2)-1;
    g(i,3)=1-140.45*x(1)/(x(2)^2*x(3));
    g(i,4)=x(1)+x(2)-1.5;
end
% all nonlinear equality constraints should be here
% formation geq(1)= ...., geq(2)=...
% If no equality constraint at all, put geq=[] as follows
geq=[];

% Test if inequalities hold so as to get the value of the Index function
% H(g) which is something like Index functions as in interior-point methods
function H=getH(g)
if g<=0 
    H=0; 
else
    H=1; 
end

% Test if equalities hold
function H=geteqH(g)
if g==0
    H=0;
else
    H=1; 
end