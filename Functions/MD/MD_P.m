function [A b Aeq beq lBound uBound xtype] = MD_P()


A = [];
b = [];
Aeq = [];
beq = [];


%lBound = [60.0, 90.0, 1.0, 0.0, 2.0]';
%uBound = [80.0, 110.0, 3.0, 1000.0, 9.0]';

lBound = [60.0, 90.0, 0.0, 0.0, 2.0]';
uBound = [80.0, 110.0, 4.0, 40.0, 9.0]';

xtype = 'IIIII';


end