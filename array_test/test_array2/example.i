%module example

%include "carrays.i"
%array_functions(double, doubleArray);

void print_array(double x[10]);
