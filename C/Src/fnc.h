#ifndef GKLS_FNC_H
#define GKLS_FNC_H

#include "gkls.h"
#include <stdlib.h>
#include <stdio.h>


enum FUNC_TYPES { D, D2, ND };

extern int FUNC_TYPE;

extern const char* FUNC_NAMES[];


int init (int, int, int, double, double, double);

int setFunction (unsigned int);

double func (double*);

int grad (double*, double*);

int hess (double*, double**);



#endif