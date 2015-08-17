#include <vector>
#include <map>
#include <boost/python.hpp>

using namespace std;

template<class T>
boost::python::list get_vect(vector<T> &list_){  
     boost::python::list py_list;
     typename vector<T>::const_iterator it;

     for(it = list_.begin(); it != list_.end(); ++it)   
          py_list.append(*it);
     return py_list;
}

boost::python::list test(){
  vector<int> vect;
  vect.push_back(2);
  vect.push_back(3);

  boost::python::list return_list;
  return_list = get_vect(vect);
  return return_list;
}

BOOST_PYTHON_MODULE(python_list){
  def("test", &test);
}