#include "Src/fnc.h"
#include <math.h>


int funcType = D;
int numDim = 4;
int numMinima = 10;

double globalDist = 0.9;
double globalRadius = 0.12;
double globalValue = -1.0;



int main ()
{
    init(funcType, numDim, numMinima, globalDist, globalRadius, globalValue);

    setFunction(1);


    int i, p = 0;
    double val = 1e9;

    for(i = 0; i < numMinima; ++i)
        if(GKLS_minima.f[i] < val)
            val = GKLS_minima.f[i], p = i;

    for(i = 0; i < numDim; ++i)
        printf("%lf ", GKLS_minima.local_min[p][i]);
    puts("");

    printf("%lf\n", GKLS_minima.f[p]);




    return 0;
}