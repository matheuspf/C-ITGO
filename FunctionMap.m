function [params fitness constraints ineqs eqs] = FunctionMap(id)





if id == 'WB'
	params = @() WB_P();
	fitness = @(x) WB_F(x);
	constraints = @(x) WB_R(x);
	ineqs = 7;
	eqs = 0;


elseif id == 'CS'
	params = @() CS_P();
	fitness = @(x) CS_F(x);
	constraints = @(x) CS_R(x);
	ineqs = 4;
	eqs = 0;

elseif id == 'PV'
	params = @() PV_P();
	fitness = @(x) PV_F(x);
	constraints = @(x) PV_R(x);
	ineqs = 4;
	eqs = 2;


elseif id == 'SR'
	params = @() SR_P();
	fitness = @(x) SR_F(x);
	constraints = @(x) SR_R(x);
	ineqs = 11;
	eqs = 0;

elseif id == 'SS'
	params = @() SS_P();
	fitness = @(x) SS_F(x);
	constraints = @(x) SS_R(x);
	ineqs = 11;
	eqs = 0;

elseif id == 'GT'
	params = @() GT_P();
	fitness = @(x) GT_F(x);
	constraints = @(x) GT_R(x);
	ineqs = 0;
	eqs = 0;


elseif id == 'TB'
	params = @() TB_P();
	fitness = @(x) TB_F(x);
	constraints = @(x) TB_R(x);
	ineqs = 3;
	eqs = 0;



elseif id == 'HT'
	params = @() HT_P();
	fitness = @(x) HT_F(x);
	constraints = @(x) HT_R(x);
	ineqs = 7;
	eqs = 0;


elseif id == 'SC'
	params = @() SC_P();
	fitness = @(x) SC_F(x);
	constraints = @(x) SC_R(x);
	ineqs = 8;
	eqs = 3;


elseif id == 'MD'
	params = @() MD_P();
	fitness = @(x) MD_F(x);
	constraints = @(x) MD_R(x);
	ineqs = 8;
	eqs = 5;

elseif id == 'TC'
	params = @() TC_P();
	fitness = @(x) TC_F(x);
	constraints = @(x) TC_R(x);
	ineqs = 8;
	eqs = 5;


else
	disp('Invalid Function');

end


end