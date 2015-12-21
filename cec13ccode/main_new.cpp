#include <iostream>
#include <vector>
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <cmath>

using namespace std;

double sphere_func (double **, int, int);
// #include "malloc.h"
// void test_func(double *, double *,int,int,int);

double *OShift,*M,*y,*z,*x_bound;
int ini_flag=0,n_flag,func_flag;


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

void generate_trial_vector(double** u, double** v, double** x, double* f, double* p, int i){
  //pbestは世代ｇからRANDOMに選んだ20この中の最良個体
  //r2, r3はかぶらないようにアーカイブから選択
  for (int j = 0; j < 30; ++j)
  {
    v[i][j] = x[i][j] + f[i]*(x[p_best][j]-x[i][j]) + f[i]*(x[r2][j]-x[r3][j]);
  }
  j_rand = rand()%30
  for (int j = 0; j < 30; ++j)
  {
    if ((rand()%100 < cr) || (j == j_rand)){
      u[i][j] = v[i][j];
    }else{
      u[i][j] = x[i][j];
    }
  }
}

int main()
{
  int i, j, k, n, m, func_num;
  double *f, *x, *u, *v, *x_new, *p, *cr, *f;
  FILE *fpt;
  // int k = 1;
  m = 100;
  n = 30;
  int index = 0

  //初期化100*100(次元数)のベクトル作成
  fpt = fopen("input_data/shift_data.txt","r");
  if (fpt == NULL)
  {
    printf("\n Error: Cannot open input file for reading \n");
  }
  x = (double *)malloc(m*n*sizeof(double));
  u = (double *)malloc(m*n*sizeof(double));
  v = (double *)malloc(m*n*sizeof(double));
  x_new = (double *)malloc(m*n*sizeof(double));

  //初期化
  if (x==NULL)
    printf("\nError: there is insufficient memory available!\n");
  for(i=0;i<m;i++)
  {
    for (int j = 0; j<n ; ++j)
    {
      fscanf(fpt,"%lf",&x[i*n+j]);
    }
    // printf("%lf\n",sphere_func(x, i, n));
  }
  fclose(fpt);

  p = (double *)malloc(m*sizeof(double));
  cr = (double *)malloc(m*sizeof(double));
  f = (double *)malloc(m*sizeof(double));

  vector<double> scr;
  vector<double> sf;
  vector<double> a;

  for (int count = 0; count < 50 ; count++)
  {

    scr.clear();
    sf.clear();
    for (int i = 0; i < m; ++i)
    {
      r = rand() % m;
      cr[i] = rand_n(mcr, r, 0.1);//正規分布
      f[i] = rand_c(mf, r, 0.1);//コーシー分布
      p = rand(0.02, 0.2);
      generate_trial_vector(u);
    }

    for (int i = 0; i < m; ++i)
    {
      if (func(u[i]) < func(x[i])){
        // x_new[i] = u[i]
        array_copy(u, x_new, 30, i);
        a.push_back(x); //アーカイブにｘを入れる
        scr.push_back(cr[i]);
        sf.push_back(f[i]);
        // array_copy(double** resource_array, double** to_array, int len, int i)
      }else{
        array_copy(x, x_new, 30, i)
      }
    }

    //アーカイブ更新作業

    if ((scr.empty() != true) && (sf.empty() != true)){
      index ++
      mcr[index]= meanwa(scr);
      mf[index]= meanwl(sf);
      if (index > 99){
        k = 0
      }
    }



    for (int i = 0; i < m; ++i)
    {
      if (sphere_func(u, i, n) < sphere_func(x, i, n) ){
        // x_new[i] = u[i];
        array_copy(u, x_new, n, i);
        // printf("%lf", sphere_func(u, i, n) );
        // printf(" %lf\n", sphere_func(x, i, n) );
      }else{
        array_copy(x, x_new, n, i);
        // x_new[i] = x[i];
        // printf("%lf", sphere_func(x, i, n) );
        // printf(" %lf\n", sphere_func(u, i, n) );
      }
    }
    array_all_copy(x_new, x, m, n);

  }


  for(i=0;i<m;i++)
  {
    for (int j = 0; j<n ; ++j)
    {
      // printf("%lf\n",x[i][j]);
    }
    printf("%lf\n",sphere_func(x, i, n));
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
