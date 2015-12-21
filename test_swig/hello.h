#include <vector>
#include <string>

class MyClass {
 public:
  MyClass(const std::string& name);
  void set_a(int a);
  int a(int d) const;
  void clear();
  int size() const;
  void set_name(const std::string& name) { name_= name;}
  const char*  name() const {return name_.c_str();}
 private:
  std::vector<int> a_;
  std::string name_;
};