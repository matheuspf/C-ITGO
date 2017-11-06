function [A b Aeq beq lBound uBound xtype] = PV_P()


A = [];
b = [];
Aeq = [];
beq = [];


lBound = [1.0, 1.0, 10.0, 10.0]';
uBound = [99.0, 99.0, 200.0, 200.0]';

%lBound = [0.0625, 0.0625, 10.0, 10.0]';
%uBound = [6.1875, 6.1875, 200.0, 200.0]';

xtype = 'IICC';


end