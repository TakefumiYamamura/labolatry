#include <vector>
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <cmath>
#include <fstream>
#include <random>
#include <iostream>
#include <vector>

using namespace std;
void test_func(double *, double *, int, int, int);

double *OShift,*M,*y,*z,*x_bound;
int ini_flag = 0, n_flag, func_flag;
int m = 100;
int dim = 30;
double fv[2];

double randc(double f){
  std::random_device seed_gen;
  std::default_random_engine engine(seed_gen());
  // 位置母数0.0、尺度母数1.0で分布させる
  std::cauchy_distribution<> dist(f, 0.1);
  // コーシー分布で乱数を生成する
  double result;
  do{
    result = dist(engine);
  }while(result <= 0);
  if (result > 1.0){
    result = 1.00;
  }
  return result;
}

double randn(double cr){
  std::random_device rnd;     // 非決定的な乱数生成器でシード生成機を生成
  std::mt19937 mt(rnd()); //  メルセンヌツイスターの32ビット版、引数は初期シード
  // //std::uniform_int_distribution<> rand100(0, 99);     // [0, 99] 範囲の一様乱数
  std::normal_distribution<> norm(cr, 0.1);       // 平均0.5, 分散値0.1の正規分布
  double result;
  result = norm(mt);
  if (result > 1.0) result = 1.0;
  if (result < 0.0) result = 0.0;
  return norm(mt);
  //std::cout << rand100(mt) << "\n";
}

double bench_mark(double **x, int i, int func_num){
  double *new_array;
  fv[0] = 0;
  new_array = (double *)malloc(dim*sizeof(double));
  for (int j = 0; j < dim ; ++j)
  {
    new_array[j] = x[i][j];
  }
  test_func(new_array, fv, dim, 1, func_num);
  return fv[0];
}



int main()
{
  int i, j,  func_num;
  double **x, **x_sort, **u, **v, **x_new, *cr, *f, *mcr, *mf;
  FILE *fpt;
  int k = 0;

  //初期化100*30(次元数)のベクトル作成
  fpt=fopen("input_data/shift_data.txt","r");
  if (fpt==NULL)
  {
    printf("\n Error: Cannot open input file for reading \n");
  }
  x=(double **)malloc(m*sizeof(double*));
  x_sort=(double **)malloc(m*sizeof(double*));
  u=(double **)malloc(m*sizeof(double*));
  v=(double **)malloc(m*sizeof(double*));
  x_new=(double **)malloc(m*sizeof(double*));
  cr=(double *)malloc(m*sizeof(double*));
  f=(double *)malloc(m*sizeof(double*));
  mcr=(double *)malloc(m*sizeof(double*));
  mf =(double *)malloc(m*sizeof(double*));

  for (int i = 0; i < m; ++i)
  {
    mcr[i] = 0.5;
    mf[i] = 0.5;
  }

  if (x==NULL)
    printf("\nError: there is insufficient memory available!\n");
  for(i=0;i<m;i++)
  {
    x[i] = (double *)malloc(dim*sizeof(double));
    x_sort[i] = (double *)malloc(dim*sizeof(double));
    u[i] = (double *)malloc(dim*sizeof(double));
    v[i] = (double *)malloc(dim*sizeof(double));
    x_new[i] = (double *)malloc(dim*sizeof(double));
    for (int j = 0; j < dim ; ++j)
    {
      x[i][j] = 0.0;
    }
  }
  func_num = 1;

    for (int i = 0; i < m; ++i)
    {
      for (int j = 0; j < dim; ++j)
      {
        cout << x[i][j] << " ";
      }
      cout << endl;
       printf("%lf\n", bench_mark(x, i, func_num) );
    }

  //デバッグ用
  // for (int i = 0; i < m; ++i)
  // {
  //   printf("%lf\n", bench_mark(x, i, func_num) );
  // }

  free(x);
  free(f);
  free(y);
  free(z);
  free(M);
  free(OShift);
}
//memcopy
