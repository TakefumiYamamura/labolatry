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
double f[2];

double cauchy(double f){
  std::random_device seed_gen;
  std::default_random_engine engine(seed_gen());
  // 位置母数0.0、尺度母数1.0で分布させる
  std::cauchy_distribution<> dist(f, 0.1);
  // コーシー分布で乱数を生成する
  double result;
  do{
    result = dist(engine);
  }while(result < 0);
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
  return norm(mt);
  //std::cout << rand100(mt) << "\n";
}

double bench_mark(double **x, int i, int func_num){
  double *new_array;
  new_array = (double *)malloc(dim*sizeof(double));
  for (int j = 0; j < dim ; ++j)
  {
    new_array[j] = x[i][j];
  }
  test_func(new_array, f, dim, 1, func_num);
  return f[0];
}

void array_copy(double** resource_array, int j ,double** to_array, int k){
  for (int j = 0; j < dim; ++j)
  {
    to_array[k][j] = resource_array[i][j];
  }
}

void array_all_copy(double** to_array, double** resource_array){
  for (int i = 0; i < m; ++i)
  {
    for (int j = 0; j < dim; ++j)
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

void shuffle(int ary[], int size)
{
    for(int i=0;i<size;i++)
    {
        int j = rand()%size;
        int t = ary[i];
        ary[i] = ary[j];
        ary[j] = t;
    }
}

void selectxp(double ** x, double ** xp){
  array_copy(x, xp, 0, 0);
  int p = 20;
  for (int i = 0; i < p; ++i)
    {
      if (bench_mark(xp, 1, 1) > bench_mark(x, i, 1) ){
        array_copy(x, xp, i, 0);
      }
    }
}

void generate_mutant_vector(double** x, double** v, int i, double* cr, double* f, double* mcr, double*mf){
  int r1, r2, r3;
  cr[m] = randn(mcr[m]);
  f[m] = randc(mf[m]);
  make_random_num(100, &r1, &r2, &r3);
  xp=(double **)malloc(1*sizeof(double*));
  xp[0] = (double *)malloc(dim*sizeof(double));
  selectxp(x, xp);
  for (int j = 0; j < dim; ++j)
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
  FILE *fpt;
  int k = 0;

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
    }
  }
  fclose(fpt);

  for (int count = 0; count < 50; count++)
  {
    for (int i = 0; i < m; ++i)
    {
      generate_mutant_vector(x, v, i, cr, f, mcr, mf);
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
      if (bench_mark(u, i, 1) < bench_mark(x, i, 1) ){
        // x_new[i] = u[i];
        array_copy(u, x_new, n, i);
        sf.push_back(f[i]);
        scr.push_back(cr[i]);
        // printf("%lf", bench_mark(u, i, 28) );
        // printf(" %lf\n", bench_mark(x, i, 28) );
        //cr とfを保存すべし
      }else{
        array_copy(x, x_new, n, i);
        // printf("%lf", bench_mark(u, i, 28) );
        // printf(" %lf\n", bench_mark(x, i, 28) );
        // x_new[i] = x[i];
        // printf("%lf", sphere_func(x, i, n) );
        // printf(" %lf\n", sphere_func(u, i, n) );
      }
    }
    sf.clear();
    scr.clear();
    array_all_copy(x, x_new);
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



  free(x);
  free(f);
  free(y);
  free(z);
  free(M);
  free(OShift);
  free(x_bound);
}
//memcopy
