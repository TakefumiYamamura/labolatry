%module hello
%include "std_string.i"
%{
void hello(void);
int sum(int d);
double get_sine(int size);
#include "hello.h"
%}

void hello(void);
int sum(int d);
double get_sine(int size);
%include "hello.h"