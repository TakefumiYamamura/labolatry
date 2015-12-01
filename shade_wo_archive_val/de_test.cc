/*
  SHADE implemented by C++ for Special Session & Competition on Real-Parameter Single Objective Optimization at CEC-2013
  See the details of SHADE in the following papers

  1. Ryoji Tanabe and Alex Fukunaga: Success-History Based Parameter Adaptation for Differential Evolution, Proc. IEEE Congress on Evolutionary Computation (CEC-2013), Cancun, June, 2013, pp. 71-78.
  2. Ryoji Tanabe and Alex Fukunaga: Evaluating the performance of SHADE on CEC 2013 benchmark problems, Proc. IEEE Congress on Evolutionary Computation (CEC-2013), Cancun, June, 2013, pp. 1952-1959.
  
  Version: 1.0   Date: 28/June/2013
  Written by Ryoji Tanabe (rt.ryoji.tanabe@gmail.com)
*/

#include "de.h"
#include <fstream>
#include <stdio.h>
#include <stdlib.h>

double *OShift,*M,*y,*z,*x_bound;
int ini_flag=0, n_flag,func_flag;

int g_function_number;
int g_problem_size;
unsigned int g_max_num_evaluations;
int g_th_num;

int g_pop_size;
int g_arc_size;
int g_memory_size;


int main(int argc, char **argv) {
  //number of runs
  int num_runs = 51;
    //dimension size. please select from 10, 30, 50, 100
  g_problem_size = 50;
  //available number of fitness evaluations 
  g_max_num_evaluations = g_problem_size * 10000;

  //random seed is based on time according to competition rules
  srand((unsigned)time(NULL));

  //SHADE parameters
  g_pop_size = 50;
  g_memory_size = 100;
  g_arc_size = g_pop_size;
  FILE *fp;
  string file_name = "../csvs/shade_wo_archive50.csv";
  fp = fopen(file_name.c_str(), "w" );
  fprintf(fp, "shade_wo_archive, mean std\n");

// for (int i = 0; i < 28; i++) {
  for (int i = 0; i < 1; i++) {
    i = 9;
    g_function_number = i + 1;
    cout << "\n-------------------------------------------------------" << endl;
    cout << "Function = " << g_function_number << ", Dimension size = " << g_problem_size << "\n" << endl;
    // fprintf(fp, "%d", g_function_number);

    Fitness *bsf_fitness_array = (Fitness*)malloc(sizeof(Fitness) * num_runs);
    Fitness mean_bsf_fitness = 0;
    Fitness std_bsf_fitness = 0;

    for (int j = 0; j < num_runs; j++) {
      g_th_num = j;
      searchAlgorithm *alg = new SHADE();
      bsf_fitness_array[j] = alg->run();
      // cout << j + 1 << "th run, " << "best fitness = " << bsf_fitness_array[j] << endl;
    }
  
    for (int j = 0; j < num_runs; j++) {
      mean_bsf_fitness += bsf_fitness_array[j];
    }

    mean_bsf_fitness /= num_runs;

    for (int j = 0; j < num_runs; j++) {
      std_bsf_fitness += pow((mean_bsf_fitness - bsf_fitness_array[j]), 2.0);
    }

    std_bsf_fitness /= num_runs;
    std_bsf_fitness = sqrt(std_bsf_fitness);

    cout  << "\nmean = " << mean_bsf_fitness << ", std = " << std_bsf_fitness << endl;
    fprintf(fp, "%f,%f\n", mean_bsf_fitness, std_bsf_fitness);
    free(bsf_fitness_array);
  }
  fclose(fp);

  return 0;
}
