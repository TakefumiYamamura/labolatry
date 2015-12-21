%module example
%{
 /* Put header files here or function declarations like below */
  extern float * oldmain();
%}

%typemap(out) float* oldmain {
  int i;
  //$1, $1_dim0, $1_dim1
  $result = PyList_New(2);
  for (i = 0; i < 2; i++) {
    PyObject *o = PyFloat_FromDouble((double) $1[i]);
    PyList_SetItem($result,i,o);
  }
}

%include "example.c"