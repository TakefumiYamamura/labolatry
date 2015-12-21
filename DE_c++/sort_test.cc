#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int comp( const void *c1, const void *c2 );


int num = 100
int dim = 30;
int main(void)
{
  int i;
  int base[20];
  double **x;
  x=(double **)malloc(num*sizeof(double*));
  for(i=0;i<m;i++)
  {
    x[i] = (double *)malloc(dim*sizeof(double));
  }

  /* 乱数の生成 */
  srand( (unsigned int)time( NULL ) );

  for( i=0; i<num; i++ ){
    for (int j = 0; j < dim; ++j)
    {
      x[i][j] = rand()%100
    }
  }

  /* クイックソート */
  printf( "¥n¥n--クイックソート実行--¥n" );
  qsort( x, num, sizeof(x[0]), comp );

  /* ソート後のデータを表示 */
  for( i=0; i<20; i++ ){
    if( i % 4 == 0 ) printf( "¥n" );
    printf( "%d¥t", base[i] );
  }

  return 0;
}

int test_func(double ** x){
  x[]
}


/* 比較関数 */
int comp( const void *c1, const void *c2 )
{
  int tmp1 = *(int *)c1;
  int tmp2 = *(int *)c2;

  if( tmp1 < tmp2 )  return -1;
  if( tmp1 == tmp2 ) return  0;
  if( tmp1 > tmp2 )  return  1;
}