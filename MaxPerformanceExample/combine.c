


//#error Please comment out the next two lines under linux, then comment this error
//#include "stdafx.h" //Visual studio expects this line to be the first one, comment out if different compiler
//#include <windows.h> // Include if under windows

#ifndef WIN32
#include <sys/time.h>
#endif
#include <stdlib.h>
#include <stdio.h>
#include <time.h>

#include "tsc_x86.h"

#define NUM_RUNS 1
#define CYCLES_REQUIRED 1e8
#define FREQUENCY 2.6e9 	// change from 3.4 to 2.6 for my computer
#define CALIBRATE

unsigned int n;
double *U, *V, *X, *Y, *Z;
double sum = 0;
double mul = 1;
double num = 0.9;
/* 
My implementation of example code to perform high performance
 */
void compute(){
	mul = 1;
	sum = 0;
	
	// Use K accumulators, in our case 4
	double acc1 = 0;
	double acc2 = 0;

	double acc5 = 1;
	double acc6 = 1;

	double tmp = 1.1;
	int i;
	for (i = 0; i < n-4; i+=4){
		acc1 += tmp + tmp;
		acc2 += tmp + tmp;

		acc5 *= tmp * tmp;
		acc6 *= tmp * tmp;
	}
	for (; i<n; i++){
		sum += tmp;
		mul *= tmp;
	}
	sum += acc1 + acc2;
	mul *= acc5 * acc6;
}

/* 
 * Timing function based on the TimeStep Counter of the CPU.
 */

double rdtsc() {
  int i, num_runs;
  myInt64 cycles;
  myInt64 start;
  num_runs = NUM_RUNS;

/* 
 * The CPUID instruction serializes the pipeline.
 * Using it, we can create execution barriers around the code we want to time.
 * The calibrate section is used to make the computation large enough so as to 
 * avoid measurements bias due to the timing overhead.
 */
#ifdef CALIBRATE
  while(num_runs < (1 << 14)) {
      start = start_tsc();
      for (i = 0; i < num_runs; ++i) {
          compute();
      }
      cycles = stop_tsc(start);

      if(cycles >= CYCLES_REQUIRED) break;

      num_runs *= 2;
  }
#endif

  start = start_tsc();
  for (i = 0; i < num_runs; ++i) {
    compute();
  }

  cycles = stop_tsc(start)/num_runs;
  return cycles;
}

double c_clock() {
  int i, num_runs;
  double cycles;
  clock_t start, end;

  num_runs = NUM_RUNS;
#ifdef CALIBRATE
  while(num_runs < (1 << 14)) {
      start = clock();
      for (i = 0; i < num_runs; ++i) {
          compute();
      }
      end = clock();

      cycles = (double)(end-start);

      // Same as in c_clock: CYCLES_REQUIRED should be expressed accordingly to the order of magnitude of CLOCKS_PER_SEC
      if(cycles >= CYCLES_REQUIRED/(FREQUENCY/CLOCKS_PER_SEC)) break;

      num_runs *= 2;
  }
#endif

  start = clock();
  for(i=0; i<num_runs; ++i)
    { compute(); }
  end = clock();

  return (double)(end-start)/num_runs;
}

#ifndef WIN32
double timeofday() {
  int i, num_runs;
  double cycles;
  struct timeval start, end;

  num_runs = NUM_RUNS;
#ifdef CALIBRATE
  while(num_runs < (1 << 14)) {
      gettimeofday(&start, NULL);
      for (i = 0; i < num_runs; ++i) {
          compute();
      }
      gettimeofday(&end, NULL);

      cycles = (double)((end.tv_sec - start.tv_sec) + (end.tv_usec - start.tv_usec)/1e6)*FREQUENCY;

      if(cycles >= CYCLES_REQUIRED) break;

      num_runs *= 2;
  }
#endif

  gettimeofday(&start, NULL);
  for(i=0; i < num_runs; ++i) {
    compute(); 
  }
  gettimeofday(&end, NULL);
  
  return (double)((end.tv_sec - start.tv_sec) + (end.tv_usec - start.tv_usec)/1e6)/ num_runs;
}

#else

double gettickcount() {
  int i, num_runs;
  double cycles, start, end;

  num_runs = NUM_RUNS;
#ifdef CALIBRATE
  while(num_runs < (1 << 14)) {
      start = (double)GetTickCount();
      for (i = 0; i < num_runs; ++i) {
          compute();
      }
      end = (double)GetTickCount();

      cycles = (end-start)*FREQUENCY/1e3; // end-start provides a measurement in the order of milliseconds

      if(cycles >= CYCLES_REQUIRED) break;

      num_runs *= 2;
  }
#endif

  start = (double)GetTickCount();
  for(i=0; i < num_runs; ++i) {
    compute(); 
  }
  end = (double)GetTickCount();

  return (end-start)/num_runs;
}

double queryperfcounter(LARGE_INTEGER f) {
  int i, num_runs;
  double cycles;
  LARGE_INTEGER start, end;

  num_runs = NUM_RUNS;
#ifdef CALIBRATE
  while(num_runs < (1 << 14)) {
      QueryPerformanceCounter(&start);
      for (i = 0; i < num_runs; ++i) {
          compute();
      }
      QueryPerformanceCounter(&end);

      cycles = (double)(end.QuadPart - start.QuadPart);
      
      // Same as in c_clock: CYCLES_REQUIRED should be expressed accordingly to the order of magnitude of f
      if(cycles >= CYCLES_REQUIRED/(FREQUENCY/f.QuadPart)) break; 

      num_runs *= 2;
  }
#endif

  QueryPerformanceCounter(&start);
  for(i=0; i < num_runs; ++i) {
    compute(); 
  }
  QueryPerformanceCounter(&end);

  return (double)(end.QuadPart - start.QuadPart)/num_runs;
}

#endif

double * main_run(int n_input){

  int i;
  double r;
  double c;
  double t;
#ifdef WIN32  
  LARGE_INTEGER f;
#endif
  double p;
  n = n_input;
  printf("n=%d \n",n);

  r = rdtsc();
  //printf("RDTSC instruction:\n %lf cycles measured => %lf seconds, assuming frequency is %lf MHz. (change in source file if different)\n\n", r, r/(FREQUENCY), (FREQUENCY)/1e6);
   
 
  c = c_clock();
  //printf("C clock() function:\n %lf cycles measured. On some systems, this number seems to be actually computed from a timer in seconds then transformed into clock ticks using the variable CLOCKS_PER_SEC. Unfortunately, it appears that CLOCKS_PER_SEC is sometimes set improperly. (According to this variable, your computer should be running at %lf MHz). In any case, dividing by this value should give a correct timing: %lf seconds. \n\n",c, (double) CLOCKS_PER_SEC/1e6, c/CLOCKS_PER_SEC);

  
#ifndef WIN32
  t = timeofday();
  //printf("C gettimeofday() function:\n %lf seconds measured\n\n",t);
#else
  t = gettickcount();
  //printf("Windows getTickCount() function:\n %lf milliseconds measured\n\n",t);

  QueryPerformanceFrequency((LARGE_INTEGER *)&f);

  p = queryperfcounter(f);
  //printf("Windows QueryPerformanceCounter() function:\n %lf cycles measured => %lf seconds, with reported CPU frequency %lf MHz\n\n",p,p/f.QuadPart,(double)f.QuadPart/1000);
#endif

	double * result = (double*)malloc(4*sizeof(double));	
  result[0] = r;
  result[1] = c;
  result[2] = t;
  result[3] = p;
  return result;
}


/* Helper function for qsort */
int compare(const void *a, const void *b){
	return (*(int*)a - *(int*)b);
}

/* Generate n=2^4, n=2^5, ... n=2^22. For each number n
 * run the case 30 times and take the median number of
 * cycles that are computed. Result id 18 numbers, which
 * are medians of 18 different input number n. */
int benchmark(){
	int i;
	int j;
	int samplesNum = 5;	// number of samples to repeat
	double samples[samplesNum];// storage for samples
	double * result;	// tmp result of a sample
	unsigned int number = 15000000;	// starting number for a sample
	double medians[18];	// medians across the samples, each 30 samples go into one median value here
	// start inserting different numbers
	
	FILE * f_y = fopen("num_of_cycles.txt", "w");
	FILE * f_x = fopen("n.txt", "w");
	for (i = 0; i<1; i++){
		
		// run 30 samples
		for (j = 0; j < samplesNum; j++){
			// result = {cycles, gettimeoffday, gettickcount, queryperfcounter}
			result = main_run(number);
			samples[j] = result[0]; // store cycles
		}	
		// Sort the cycle values from 30 samples
		qsort(samples, samplesNum, sizeof(double), compare);
		// Take the median of 30 samples
		medians[i] = samples[0];

		// store result into files
		fprintf(f_y, "%f\n", medians[i]);
		fprintf(f_x, "%d\n", number);

		number = number << 1; // multiply by 2		
	}
	// print medians of cycles to stdout
	
	fclose(f_y);
	fclose(f_x);
	return 0;
}


int main(int argc, char **argv){
  // if no arguments, run benchmark	
  if (argc!=2) {benchmark();}
  // if arguments, run that specific case with a given n
  else {
    n = atoi(argv[1]);
    main_run(n);
    return 0;
  }
}
