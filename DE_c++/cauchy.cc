#include <fstream>
#include <random>
#include <iostream>

int main()
{
  std::random_device seed_gen;
  std::default_random_engine engine(seed_gen());

  // 位置母数0.0、尺度母数1.0で分布させる
  std::cauchy_distribution<> dist(0.5, 0.1);

  // std::ofstream file("cauchy_distribution.tsv");
  // for (size_t n = 0; n < 1000; ++n) {
    // コーシー分布で乱数を生成する
    double result;
    do{
      result = dist(engine);
    }while(result < 0);
    // double result = dist(engine);
    if (result > 1.0){
      result = 1.00;
    }
    std::cout << result << "\n";
  // }
}