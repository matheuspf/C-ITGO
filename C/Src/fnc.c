#include "fnc.h"

int FUNC_TYPE = 0;

const char* FUNC_NAMES[] = {"D", "D2", "ND"};


int init (int funcType, int numDim, int numMinima, double globalDist, double globalRadius, double globalValue)
{
	int error_code;

	if(funcType < 0 || funcType > 2)
		return -1;

    FUNC_TYPE = funcType;

    if((error_code = GKLS_set_default()) != GKLS_OK)
		return error_code;

    GKLS_dim = numDim;
	GKLS_num_minima = numMinima;

	if((error_code = GKLS_domain_alloc()) != GKLS_OK)
		return error_code;

	GKLS_global_dist = globalDist;
	GKLS_global_radius = globalRadius;
	GKLS_global_value = globalValue;

	if((error_code = GKLS_parameters_check()) != GKLS_OK)
		return error_code;

	return GKLS_OK;
}


int setFunction (unsigned int funcNum)
{
    int error_code;

	if((error_code = GKLS_arg_generate(funcNum)) != GKLS_OK)
		return error_code;

	return GKLS_OK;
}


double func (double* x)
{
	switch(FUNC_TYPE)
	{
		case D:
			return GKLS_D_func(x);

		case D2:
			return GKLS_D2_func(x);

		case ND:
			return GKLS_ND_func(x);
		
		//default:
			//printf("Invalid function type for function call!!!");
	}

	return 1e9;
}


int grad (double* x, double* g)
{
	switch(FUNC_TYPE)
	{
		case D:
			return GKLS_D_gradient(x, g);

		case D2:
			return GKLS_D2_gradient(x, g);

		//default:
			//fprintf(stderr, "Invalid function type for gradient call!!!");
	}

	return 0.0;
}


int hess (double* x, double** h)
{
	switch(FUNC_TYPE)
	{
		case D2:
			return GKLS_D2_hessian(x, h);

		//default:
			//fprintf(stderr, "Invalid function type for hessian call!!!");
	}

	return 0.0;
}
