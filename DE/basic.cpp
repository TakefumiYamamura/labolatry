#include <boost/python.hpp>

int add(int lhs, int rhs)
{
    return lhs + rhs;
}

BOOST_PYTHON_MODULE(basic)
{
    using namespace boost::python;
    def("add", &add);
}