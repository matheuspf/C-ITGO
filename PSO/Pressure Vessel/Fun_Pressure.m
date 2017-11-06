
%% Objective 
function z=Fun_Pressure(xn)

z=cost_Pressure(xn);

% Apply nonlinear constraints by penalty method
% Z=f+sum_k=1^N lam_k g_k^2 *H(g_k) where lam_k >> 1 
z=z+getnonlinear(xn);
%% Cost or Objective function
 function z=cost_Pressure(xn)
 %xn = [0.75 0.375 38.8601 221.3655];
     [ll,~] = size(xn);
 z = zeros(ll,1);
 for i = 1 : ll
     x = xn(i,:);
    z(i) =  0.6224*x(1)*x(3)*x(4)+1.7781*x(2)*x(3)^2 ...
            +3.1661*x(1)^2*x(4)+19.84*x(1)^2*x(3);
 end
 %%
function Z=getnonlinear(xn)
[ll,~] = size(xn);
Z=zeros(ll,1);
% Penalty constant >> 1
lam=10^20; lameq=10^20;
% Get nonlinear constraints
[G,geq]=constraint_pressure(xn);

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
function [g,geq]=constraint_pressure(xn)
% All nonlinear inequality constraints should be here
% If no inequality constraint at all, simple use g=[];
% Note: there was some typo in Cagnina et al.'s paper, as the bracket near
% 12566 ( ) was misplaced in g(2), a factor 7178 instead of 71785 in g(1) 
[ll,~] = size(xn);
g = zeros(ll,4);
for i = 1 : ll
    x = xn(i,:);
    g(i,1)=-x(1)+0.0193*x(3);
    g(i,2)=-x(2)+0.00954*x(3);
    g(i,3)= -pi*x(3)^2*x(4)-4*(pi/3)*x(3)^3+1296000;
    g(i,4)=x(4)-240;
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