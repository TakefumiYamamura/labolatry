#include <vector>
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <cmath>
#include <fstream>
#include <random>
#include <iostream>
#include <stdio.h> 
#include <stdlib.h> /* for srand48(), drand48() */
#include <math.h>  
#include <vector>
// double sphere_func(double **, int, int);
// #include "malloc.h"

using namespace std;
void test_func(double *, double *, int, int, int);

// void test_func(double *, double *,int,int,int);

double *OShift,*M,*y,*z,*x_bound;
int ini_flag = 0, n_flag, func_flag;
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

double cauchy(double f){
    std::random_device seed_gen;
  std::default_random_engine engine(seed_gen());

  // 位置母数0.0、尺度母数1.0で分布させる
  std::cauchy_distribution<> dist(f, 0.1);

  // std::ofstream file("cauchy_distribution.tsv");
  // for (size_t n = 0; n < 1000; ++n) {
    // コーシー分布で乱数を生成する
    double result;
    do{
      result = dist(engine);
    }while(result < 0);
    // double result = dist(engine);
    if (result > 1.0){
      result = 1.00;
    }
    // std::cout << result << "\n";
    return result;
  // }
}

double randn(double cr){
      std::random_device rnd;     // 非決定的な乱数生成器でシード生成機を生成
    std::mt19937 mt(rnd()); //  メルセンヌツイスターの32ビット版、引数は初期シード
    // //std::uniform_int_distribution<> rand100(0, 99);     // [0, 99] 範囲の一様乱数
    std::normal_distribution<> norm(cr, 0.1);       // 平均0.5, 分散値0.1の正規分布
    return norm(mt);
    for (int i = 0; i < 20; ++i) {
      //std::cout << rand100(mt) << "\n";
      // std::cout << norm(mt) << "\n";
    }
}


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
  // printf("%lf  ",f[0]);
  // printf("%lf\n",f[1]);
  return f[0];
}


void array_copy(double** resource_array, double** to_array, int len, int i){
  for (int j = 0; j < len; ++j)
  {
    to_array[i][j] = resource_array[i][j];
  }
}

void array_copy_2(double** resource_array, double** to_array, int len, int i, int k){
  for (int j = 0; j < len; ++j)
  {
    to_array[k][j] = resource_array[i][j];
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

void shuffle(int ary[],int size)
{
    for(int i=0;i<size;i++)
    {
        int j = rand()%size;
        int t = ary[i];
        ary[i] = ary[j];
        ary[j] = t;
    }
}

void selectxp(double ** x, double ** xp, int m, int n){
  array_copy_2(x, xp, n, 0, 0);
  int p = 20;
  for (int i = 0; i < p; ++i)
    {
      if (adjustment(xp, 1, 1) > adjustment(x, i, 1) ){
        array_copy_2(x, xp, n, i, 0);
      }
    }
}

void generate_mutant_vector(double** x, double** v, int i, int n, double* cr, double* f, double* mcr, double*mf, int m){
  int r1, r2, r3;
  cr[m] = randn(mcr[m]);
  f[m] = randc(mf[m]);
  make_random_num(100, &r1, &r2, &r3);
  xp=(double **)malloc(1*sizeof(double*));
  xp[0] = (double *)malloc(n*sizeof(double));
  selectxp(x, xp, m, n);
  for (int j = 0; j < n; ++j)
  {
    // make_random_num(100, &r1, &r2, &r3);
    // printf("%lf  %lf ", x[r2][j], x[r3][j]);
    double zettai = x[r2][j] + x[r3][j];
    v[i][j] = x[i][j] + f[m] * std::fabs(zettai) + f[m]* (xp[0] - x[i][j]);
    // printf("%lf  %lf ", x[r2][j], x[r3][j]);
    // printf("%d %d %d\n", r1, r2,r3);
  }
}

void crossover_binomial(double** x, double** v, double** u, int i, int j_rand, double**cr){
  if ( (((rand() % 100) / 100) < cr[i]) || i == j_rand){
    u[i] = v[i];
  }else{
    u[i] = x[i];
  }
}

int main()
{
  int i, j,  func_num;
  double *f, **x, **u, **v, **x_new;
  int m = 100;
  int n = 30;
  FILE *fpt;
  int k = 0;
  // m=100;
  // n=30;

  //初期化100*30(次元数)のベクトル作成
  fpt=fopen("input_data/M_D30.txt","r");
  if (fpt==NULL)
  {
    printf("\n Error: Cannot open input file for reading \n");
  }
  x=(double **)malloc(m*sizeof(double*));
  u=(double **)malloc(m*sizeof(double*));
  v=(double **)malloc(m*sizeof(double*));
  x_new=(double *)malloc(m*sizeof(double*));
  cr=(double *)malloc(m*sizeof(double*));
  f=(double *)malloc(m*sizeof(double*));
  mcr=(double *)malloc(m*sizeof(double*));
  mf=(double *)malloc(m*sizeof(double*));

  for (int i = 0; i < m; ++i)
  {
    mcr[i] = 0.5
    mf[i] = 0.5
  }


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

  for (int count = 0; count < 50; count++)
  {
    for (int i = 0; i < m; ++i)
    {
      generate_mutant_vector(x, v, i, n, cr, f, mcr, mf, m);
    }
    int j_rand = rand()%n ;
    for (int i = 0; i < m; ++i)
    {
      crossover_binomial(x, v, u, i, j_rand, cr);
    }
    vector<double> scr;
    vector<double> sf;
    for (int i = 0; i < m; ++i)
    {
      if (adjustment(u, i, 1) < adjustment(x, i, 1) ){
        // x_new[i] = u[i];
        array_copy(u, x_new, n, i);
        sf.push_back(f[i]);
        scr.push_back(cr[i]);
        // printf("%lf", adjustment(u, i, 28) );
        // printf(" %lf\n", adjustment(x, i, 28) );
        //cr とfを保存すべし
      }else{
        array_copy(x, x_new, n, i);
        // printf("%lf", adjustment(u, i, 28) );
        // printf(" %lf\n", adjustment(x, i, 28) );
        // x_new[i] = x[i];
        // printf("%lf", sphere_func(x, i, n) );
        // printf(" %lf\n", sphere_func(u, i, n) );
      }
    }
    sf.clear();
    scr.clear();
    array_all_copy(x_new, x, m, n);
    x = x_new;

    if (k == m){
      k = 0;
    }

  //update_mcr
  for (int i = 0; i < count; ++i)
  {
    /* code */
  }
  //update_mf

  k++;
  }


  for(i=0;i<m;i++)
  {
    for (int j = 0; j<n ; ++j)
    {
      // printf("%lf\n",x[i][j]);
    }
    printf("%lf\n",adjustment(x, i, 1));
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
