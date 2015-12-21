%module test_cnv

%{
#include "test_cnv.h"
%}

void * convert_char(char *);
void * convert_int(int *);
void * convert_double(double *);