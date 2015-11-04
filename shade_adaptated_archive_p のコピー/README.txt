Author: Ryoji Tanabe

##############################
SHADE implemented by C++ for Special Session & Competition on Real-Parameter Single Objective Optimization at CEC-2013.
The version submitted to the competition (version 1.0.0) had a bug in the archive update mechanism which resulted in a slight performance degradation.
Version 1.0.1 fixes the bug and achieves slightly better performance compared to 1.0.0.
See the details of SHADE in the following papers:

  1. Ryoji Tanabe and Alex Fukunaga: Success-History Based Parameter Adaptation for Differential Evolution, Proc. IEEE Congress on Evolutionary Computation (CEC-2013), Cancun, June, 2013, pp. 71-78.
  2. Ryoji Tanabe and Alex Fukunaga: Evaluating the performance of SHADE on CEC 2013 benchmark problems, Proc. IEEE Congress on Evolutionary Computation (CEC-2013), Cancun, June, 2013, pp. 1952-1959.
  
##############################
System configurations in our experimental enviroment:

OS: Ubuntu 12.04 LTS
CPU: core i7 (2.20GHz)
RAM: 8GB
Language: C++
Compiler: g++ (gcc) with -O3 optimization flag

##############################
How to execute:

Step 1. #make
Step 2. #./shade_exe

Dimension size and parameter settings of SHADE are easily mutable by rewriting source code in de_test.cc.
If you have any questions, please feel free to contact me (rt.ryoji.tanabe@gmail.com).
