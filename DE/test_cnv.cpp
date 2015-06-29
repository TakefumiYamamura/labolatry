#include "test_cnv.h"

void * convert_char(char * src)
{
  return reinterpret_cast<void *>(src);
}

void * convert_double(double * src)
{
  return reinterpret_cast<void *>(src);
}

void * convert_int(int * src)
{
  return reinterpret_cast<void *>(src);
}