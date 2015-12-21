#include <vector>
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <cmath>
#include <fstream>
#include <random>
#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;
void test_func(double *, double *, int, int, int);

double *OShift,*M,*y,*z,*x_bound;
int ini_flag = 0, n_flag, func_flag;
int m = 100;
int dim = 30;
double fv[2];

// double fx[m];
// double fu[m];
double *fx;
double *fu;


double randc(double f){
  random_device seed_gen;
  default_random_engine engine(seed_gen());
  cauchy_distribution<> dist(f, 0.1);
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
  random_device rnd;
  mt19937 mt(rnd());
  std::normal_distribution<> norm(cr, 0.1);
  double result;
  result = norm(mt);
  if (result > 1.0) result = 1.0;
  if (result < 0.0) result = 0.0;
  return result;
}

void all_bench_mark(double ** x, int i, int func_num){
  double *new_array;
  new_array = (double *)malloc(m*dim*sizeof(double));
  for (int i = 0; i < m; ++i)
  {
    for (int j = 0; j < dim; ++j)
    {
      new_array[j] = x[i][j];
    }
  }
  test_func(new_array, fv, dim, m, func_num);
}

double bench_mark(double **x, int i, int func_num){
  double *new_array;
  new_array = (double *)malloc(dim*sizeof(double));
  for (int j = 0; j < dim ; ++j)
  {
    new_array[j] = x[i][j];
  }
  test_func(new_array, fv, dim, 1, func_num);
  return fv[0];
}

void array_copy(double** to_array, int k ,double** resource_array, int i){
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

void make_random_num(int n, int *r1, int *r2, int archive_size){
  do {
    *r1 = rand() % n;
    *r2 = rand() % n;
  } while (*r1 == *r2);
}

double randp(){
  int p;
  do{
    p = rand() % 21;
  }while(p < 2);
  return p;
}

void replace(double **x, int a, int b){
  for (int i = 0; i < dim; ++i)
  {
    double array_context = x[a][i];
    x[a][i] = x[b][i];
    x[b][i] = array_context;
  }
}

void sort_by_func(double **x, int func_num){
  int i, k;
  for (i = 0; i < m; ++i)
  {
    for (k = 0; k < m; ++k)
    {
      if (bench_mark(x, i, func_num) > bench_mark(x, k, func_num) )
      {
        replace(x, i, k);
      }
    }
  }
}

void selectxp(double ** x, double * xp){
  int p = randp();
  for (int i = 0; i < dim; ++i)
  {
    xp[i] = x[p][i];
  }
}

void generate_mutant_vector(double** x, double** v, int i, double* cr, double* f, double* mcr, double* mf, double** x_sort, vector<vector<double> >& archive){
  int r1, r2, r3;
  cr[i] = randn(mcr[i]);
  f[i] = randc(mf[i]);
  double *xp;
  xp = (double *)malloc(dim*sizeof(double));
  selectxp(x_sort, xp);
  make_random_num(m, &r1, &r2, int(archive.size()));
  if( r2 < m ){
    for (int j = 0; j < dim; ++j)
    {
      v[i][j] = x[i][j] + f[i] * (x[r2][j] - x[r3][j]) + f[i]* (xp[j] - x[i][j]);
    }
  }else{
    for (int j = 0; j < dim; ++j)
    {
      v[i][j] = x[i][j] + f[i] * (archive[r2 - m][j] - x[r3][j]) + f[i]* (xp[j] - x[i][j]);
    }
  }
  free(xp);
}

void crossover_binomial(double** x, double** v, double** u, int i, int j_rand, double*cr){
  for (int t = 0; t < dim; ++t)
  {
    if ( ((double)rand()/((double)RAND_MAX+1) < cr[i]) || i == j_rand){
      u[i][t] = v[i][t];
    }else{
      u[i][t] = x[i][t];
    }
  }
}

void make_w(vector<double>& w, vector<double>& df ){
  double sum = 0;
  for (int i = 0; i < int(df.size()); ++i)
  {
    sum += df[i];
  }
  for (int i = 0; i < int(df.size()); ++i)
  {
    w.push_back(df[i]/sum);
  }
}

void update_mcr(double* mcr, vector<double>& scr, vector<double>& w, int index){
  if (int(scr.size()) != 0){
    mcr[index] = 0;
    for (int i = 0; i < int(scr.size()); ++i)
    {
      mcr[index] += w[i]*scr[i];
    }
  }
}

void update_mf(double* mf, vector<double>& sf, vector<double>& w, int index){
  double sum1 = 0;
  double sum2 = 0;
  if (int(sf.size()) != 0){
    mf[index] = 0;
    for (int i = 0; i < int(sf.size()); ++i)
    {
      sum1 += w[i] * sf[i] * sf[i];
      sum2 += w[i] * sf[i];
    }
    mf[index] = sum1/sum2;
  }
}

int main()
{
  int i, j,  func_num;
  FILE *fp;
  // char *fname = "shade_with_archive.csv";
  double **x, **x_sort, **u, **v, **x_new, *cr, *f, *mcr, *mf;
  int k = 0;
  x=(double **)malloc(m*sizeof(double*));
  x_sort=(double **)malloc(m*sizeof(double*));
  u=(double **)malloc(m*sizeof(double*));
  v=(double **)malloc(m*sizeof(double*));
  x_new=(double **)malloc(m*sizeof(double*));
  cr=(double *)malloc(m*sizeof(double*));
  f=(double *)malloc(m*sizeof(double*));
  mcr=(double *)malloc(m*sizeof(double*));
  mf =(double *)malloc(m*sizeof(double*));

  fx = (double *)malloc(m*dim*sizeof(double));
  fu = (double *)malloc(m*dim*sizeof(double));
  fp = fopen( "shade_without_archive.csv", "w" );

  if( fp == NULL ){
    printf( "ファイルが開けません¥n");
    return -1;
  }

  for (int i = 0; i < m; ++i)
  {
    mcr[i] = 0.5;
    mf[i] = 0.5;
  }

  for(i=0;i<m;i++)
  {
    x[i] = (double *)malloc(dim*sizeof(double));
    x_sort[i] = (double *)malloc(dim*sizeof(double));
    u[i] = (double *)malloc(dim*sizeof(double));
    v[i] = (double *)malloc(dim*sizeof(double));
    x_new[i] = (double *)malloc(dim*sizeof(double));
    for (int j = 0; j < dim ; ++j)
    {
      // x[i][j] = (double)rand()/((double)RAND_MAX+1) - 100.0;
      x[i][j] = (double)rand()/((double)RAND_MAX+1) * 200 - 100.0;
    }
  }

  vector< vector<double> > archive;
  //本当は3000
  for (int count = 0; count < 3000; count++)
  {
    func_num = 1;
    array_all_copy(x_sort, x);
    sort_by_func(x_sort, func_num);

    for (int i = 0; i < m; ++i)
    {
      generate_mutant_vector(x, v, i, cr, f, mcr, mf, x_sort, archive);
    }
    int j_rand = rand()%dim ;
    for (int i = 0; i < m; ++i)
    {
      crossover_binomial(x, v, u, i, j_rand, cr);
    }
    vector<double> scr;
    vector<double> sf;
    vector<double> df;
    vector<double> w;
    for (int i = 0; i < m; ++i)
    {
      if (bench_mark(u, i, func_num) < bench_mark(x, i, func_num) ){
        array_copy(x_new, i, u, i);
        sf.push_back(f[i]);
        scr.push_back(cr[i]);
        df.push_back(abs(bench_mark(u, i, func_num) - bench_mark(x, i, func_num)));
        archive.push_back(vector<double>(dim));
        if (int(archive.size()) > m && !archive.empty()){
          archive.pop_back();
        }
        for (int k = 0; k < dim; ++k)
        {
          archive[int(archive.size()) - 1][k] = x[i][k];
        }
        random_shuffle(archive.begin(), archive.end());
      }else{
        array_copy(x_new, i, x, i);
      }
    }
    array_all_copy(x, x_new);
    if (k == m){
      k = 0;
    }
    make_w(w, df);
    update_mcr(mcr, scr, w, k);
    update_mf(mf, sf, w, k);

    for (int i = 0; i < m; ++i)
    {
      for (int j = 0; j < dim; ++j)
      {
        // cout << x[i][j] << " ";
      }
      // cout << endl;
  //     fprintf( fp, "%s,%d,%d,%f,%f¥n", s1, n1, n1+1, f1, f1+0.1 );
  // fprintf( fp, "%s,%d,%d,%f,%f¥n", s2, n2, n2+1, f2, f2+0.1 );
      fprintf(fp, "%d世代目%d番目 %f\n", count, i, bench_mark(x, i, func_num));


      // printf("%lf\n", bench_mark(x, i, func_num) );
    }


    k++;
    w.clear();
    sf.clear();
    scr.clear();
    df.clear();
  }

  fclose( fp );
  free(x);
  free(f);
  free(y);
  free(z);
  free(M);
  free(OShift);
  free(x_bound);
}
