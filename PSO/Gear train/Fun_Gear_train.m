
%% Objective
function z=Fun_Gear_train(xn)

z=cost_Gear_Train(xn);

% Apply nonlinear constraints by penalty method
% Z=f+sum_k=1^N lam_k g_k^2 *H(g_k) where lam_k >> 1 

%% Cost or Objective function
 function z=cost_Gear_Train(xn)
 [ll,~] = size(xn);
 z = zeros(ll,1);
 for i = 1 : ll
     x = xn(i,:);
    z(i)=((1/6.931)-x(3)*x(2)/(x(1)*x(4)))^2;
    %z(i)=((0.145)-x(3)*x(2)/(x(1)*x(4)))^2;
 end
 %%
