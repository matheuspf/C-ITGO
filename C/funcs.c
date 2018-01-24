#include "Src/fnc.h"
#include <math.h>
#include <string.h>
#include "mex.h"

// mex funcs.c Src/fnc.c Src/gkls.c Src/rnd_gen.c CFLAGS="-std=c11 -fPIC -lm -O3"

int INIT = 1;

const int funcType = D;
const int numDim = 4;
const int numMinima = 10;

double globalDist = 0.9;
double globalRadius = 0.12;
double globalValue = -1.0;


void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    if (INIT)
        init(funcType, numDim, numMinima, globalDist, globalRadius, globalValue);

    INIT = 0;

    if (nrhs >= 1)
    {
        if (mxIsScalar(prhs[0]))
            setFunction(lround(mxGetScalar(prhs[0])));

        else
        {
            double *x = (double *)mxGetData(prhs[0]);

            double fx = func(x);

            plhs[0] = mxCreateDoubleScalar(fx);

            if(nlhs >= 2)
            {
                double gr[numMinima];
                
                grad(x, gr);

                plhs[1] = mxCreateDoubleMatrix(1, numDim, mxREAL);
                memcpy(mxGetPr(plhs[1]), gr, numDim * sizeof(double));
            }
        }
    }

    else
    {
        int i, p = 0;
        double val = 1e9;

        for (i = 0; i < numMinima; ++i)
            if (GKLS_minima.f[i] < val)
                val = GKLS_minima.f[i], p = i;

        plhs[0] = mxCreateDoubleMatrix(1, numDim, mxREAL);
        memcpy(mxGetPr(plhs[0]), GKLS_minima.local_min[p], numDim * sizeof(double));
    }
}