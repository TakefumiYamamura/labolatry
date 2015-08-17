#include <iostream>
#include <vector>
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <cmath>

double sphere_func (double **, int);
// #include "malloc.h"


// void test_func(double *, double *,int,int,int);

double *OShift,*M,*y,*z,*x_bound;
int ini_flag=0,n_flag,func_flag;

void make_random_num(int n, int *r1, int *r2, int *r3){
  do {
    *r1 = rand() % n;
    *r2 = rand() % n;
    *r3 = rand() % n;
  } while ((*r1 == *r2) || (*r2 == *r3) || (*r3 == *r1));
}

void generate_mutant_vector(double** x, double** v, int i, int n){
  int r1, r2, r3;
  double F = 0.00001;
  make_random_num(100, &r1, &r2, &r3);
  for (int j = 0; j < n; ++j)
  {
    v[i][j] = x[r1][j] + F * std::abs(x[r2][j] - x[r3][j]);
  }
}
// crossover_binomial(x, v, u, i)
void crossover_binomial(double** x, double** v, double** u, int i, int j_rand){
  double cr = 0.1;
  if ( (((rand() % 1000) / 1000) < cr) || i == j_rand){
    u[i] = v[i];
  }else{
    u[i] = x[i];
  }
}

int main()
{
  int i, j, k, n, m, func_num;
  double *f, **x, **u, **v;
  FILE *fpt;

  m=100;
  n=30;

  //初期化100*30(次元数)のベクトル作成
  fpt=fopen("input_data/M_D30.txt","r");
  if (fpt==NULL)
  {
    printf("\n Error: Cannot open input file for reading \n");
  }
  x=(double **)malloc(m*sizeof(double*));
  u=(double **)malloc(m*sizeof(double*));
  v=(double **)malloc(m*sizeof(double*));


  if (x==NULL)
    printf("\nError: there is insufficient memory available!\n");
  for(i=0;i<m;i++)
  {
    x[i] = (double *)malloc(n*sizeof(double));
    u[i] = (double *)malloc(n*sizeof(double));
    v[i] = (double *)malloc(n*sizeof(double));
    for (int j = 0; j<n ; ++j)
    {
      fscanf(fpt,"%lf",&x[i][j]);
      // printf("%lf\n",x[i][j]);
    }
    printf("%lf\n",sphere_func(x, i));
  }
  fclose(fpt);

  for (int count = 0; count < 5000 ; ++count)
  {
    for (int i = 0; i < m; ++i)
    {
      generate_mutant_vector(x, v, i, n);
    }
    int j_rand = rand()%n ;
    for (int i = 0; i < m; ++i)
    {
      crossover_binomial(x, v, u, i, j_rand);
    }
    for (int i = 0; i < m; ++i)
    {
      if (sphere_func(u, i) < sphere_func(x, i) ){
        x[i] = u[i];
      }else{
        x[i] = x[i];
      }
    }
  }
  for(i=0;i<m;i++)
  {
    for (int j = 0; j<n ; ++j)
    {
      // printf("%lf\n",x[i][j]);
    }
    printf("%lf\n",sphere_func(x, i));
  }

    // for (i = 1; i < m; i++)
    // {
    //   for (j = 0; j < n; j++)
    //   {
    //     // x[i*n+j]=0.0;
    //     printf("%lf\n",x[i*n+j]);
    //   }
    // }
  free(x);
  free(f);
  free(y);
  free(z);
  free(M);
  free(OShift);
  free(x_bound);
}

