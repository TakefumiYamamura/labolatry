#include <iostream>
#include <vector>
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <cmath>

// double sphere_func(double **, int, int);
// #include "malloc.h"
void test_func(double *, double *, int, int, int);

// void test_func(double *, double *,int,int,int);

double *OShift,*M,*y,*z,*x_bound;
int ini_flag=0,n_flag,func_flag;
double f[2];
// double f[0] = 0.0;

// double *new_array;
// double * new_array = (double *)malloc(n*sizeof(double));
// int m, n;


// double change_array(double** array, int i, int n){
//   double *new_array;
//   new_array = (double *)malloc(n*sizeof(double));
//   for (int j = 0; j < n ; ++j)
//   {
//     new_array[j] = array[i][j];
//   }
//   return new_array;
// }

double adjustment(double **x, int i, int func_num){
  double *new_array;
  new_array = (double *)malloc(60*sizeof(double));

  for (int j = 0; j < 30 ; ++j)
  {
    new_array[j] = 0;
    new_array[j+30] = 0;
    new_array[j] = x[i][j];
    // printf("%lf\n",new_array[j]);
  }
  // printf("%lf\n",new_array[0]);

  test_func(new_array, f, 30, 2, func_num);
  printf("%lf  ",f[0]);
  printf("%lf\n",f[1]);
  return f[1];
}


void array_copy(double** resource_array, double** to_array, int len, int i){
  for (int j = 0; j < len; ++j)
  {
    to_array[i][j] = resource_array[i][j];
  }
}

void array_all_copy(double** resource_array, double** to_array, int m, int n){
  for (int i = 0; i < m; ++i)
  {
    for (int j = 0; j < n; ++j)
    {
      to_array[i][j] = resource_array[i][j];
    }
  }
}


void make_random_num(int n, int *r1, int *r2, int *r3){
  do {
    *r1 = rand() % n;
    *r2 = rand() % n;
    *r3 = rand() % n;
  } while ((*r1 == *r2) || (*r2 == *r3) || (*r3 == *r1));
}

void generate_mutant_vector(double** x, double** v, int i, int n){
  int r1, r2, r3;
  double F = 0.5;
  make_random_num(100, &r1, &r2, &r3);
  for (int j = 0; j < n; ++j)
  {
    // make_random_num(100, &r1, &r2, &r3);
    // printf("%lf  %lf ", x[r2][j], x[r3][j]);
    double zettai = x[r2][j] + x[r3][j];
    v[i][j] = x[r1][j] - F * std::fabs(zettai);
    // printf("%lf  %lf ", x[r2][j], x[r3][j]);
    // printf("%d %d %d\n", r1, r2,r3);
  }
}

void crossover_binomial(double** x, double** v, double** u, int i, int j_rand){
  double cr = 0.5;
  if ( (((rand() % 100) / 100) < cr) || i == j_rand){
    u[i] = v[i];
  }else{
    u[i] = x[i];
  }
}

int main()
{
  int i, j, k, func_num;
  double *f, **x, **u, **v, **x_new;
  int m = 100;
  int n = 30;
  FILE *fpt;


  // m=100;
  // n=30;

  //初期化100*30(次元数)のベクトル作成
  fpt=fopen("input_data/shift_data.txt","r");
  if (fpt==NULL)
  {
    printf("\n Error: Cannot open input file for reading \n");
  }
  x=(double **)malloc(m*sizeof(double*));
  u=(double **)malloc(m*sizeof(double*));
  v=(double **)malloc(m*sizeof(double*));
  x_new=(double **)malloc(m*sizeof(double*));


  if (x==NULL)
    printf("\nError: there is insufficient memory available!\n");
  for(i=0;i<m;i++)
  {
    x[i] = (double *)malloc(n*sizeof(double));
    u[i] = (double *)malloc(n*sizeof(double));
    v[i] = (double *)malloc(n*sizeof(double));
    x_new[i] = (double *)malloc(n*sizeof(double));
    for (int j = 0; j<n ; ++j)
    {
      fscanf(fpt,"%lf",&x[i][j]);
      // printf("%lf\n",x[i][j]);
    }
    // printf("%lf\n",sphere_func(x, i, n));
  }
  fclose(fpt);

  for (int count = 0; count < 1; count++)
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
      if (adjustment(u, i, 1) < adjustment(x, i, 1) ){
        // x_new[i] = u[i];
        array_copy(u, x_new, n, i);
        // printf("%lf", adjustment(u, i, 28) );
        // printf(" %lf\n", adjustment(x, i, 28) );
      }else{
        array_copy(x, x_new, n, i);
        // printf("%lf", adjustment(u, i, 28) );
        // printf(" %lf\n", adjustment(x, i, 28) );
        // x_new[i] = x[i];
        // printf("%lf", sphere_func(x, i, n) );
        // printf(" %lf\n", sphere_func(u, i, n) );
      }
    }
    array_all_copy(x_new, x, m, n);
    x = x_new;
  }


  for(i=0;i<m;i++)
  {
    for (int j = 0; j<n ; ++j)
    {
      // printf("%lf\n",x[i][j]);
    }
    // printf("%lf\n",adjustment(x, i, 1));
  }

  free(x);
  free(f);
  free(y);
  free(z);
  free(M);
  free(OShift);
  free(x_bound);
}
//memcopy
