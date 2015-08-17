#include <stdio.h>
#include <math.h>
#include <stdlib.h>

#define INF 1.0e99
#define EPS 1.0e-14
#define E  2.7182818284590452353602874713526625
#define PI 3.1415926535897932384626433832795029

extern double *OShift,*M,*y,*z,*x_bound;;
extern int ini_flag,n_flag,func_flag;

void sphere_func (double **, double *, int);

void sphere_func (double **x, double *f, int t) /* Sphere */
{
  f[0] = 0.0;
   for (int i = 0; i < sizeof(x[i])/sizeof(x[i][0]); ++i)
  {
    f[0] += x[t][i] * x[t][i]
  }
}
