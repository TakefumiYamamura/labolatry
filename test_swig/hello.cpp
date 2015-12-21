#include "hello.h"
#include <cstdio>
#include <cmath>

void hello(void)
{
  printf("Hello World!!\n");
}

int sum(int d) {
  int ret=0;
  for (int i=0;i<d;++i) {
    ret += i;
  }
  return ret;
}

double get_sine(int size) {
  const double width = 2 * M_PI/(double)size;
  printf("size = %d, width = %e\n",size,width);
  double sum = 0.0;
  for (int i=0;i<size;++i) {
    double x = i * width;
    sum += sin(x);
  }
  return sum;
}


MyClass::MyClass(const std::string& name) : a_(0),name_(name) 
{
}

void MyClass::set_a(int a) {
  a_.push_back(a);
}

int MyClass::a(int d) const {
  if (d>=a_.size()) {
    return 0;
  }
  return a_[d];
}

void MyClass::clear() {
  a_.clear();
}

int MyClass::size() const {
  return a_.size();
}
