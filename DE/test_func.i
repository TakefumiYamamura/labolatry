/* File: example.i */
%module test_func

%{
#define SWIG_FILE_WITH_INIT
#include "test_func.h"
%}


void test_func(double *x, double *f, int nx, int mx,int func_num);
