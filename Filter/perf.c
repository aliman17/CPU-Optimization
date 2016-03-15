/**
 *      _________   _____________________  ____  ______
 *     / ____/   | / ___/_  __/ ____/ __ \/ __ \/ ____/
 *    / /_  / /| | \__ \ / / / /   / / / / / / / __/
 *   / __/ / ___ |___/ // / / /___/ /_/ / /_/ / /___
 *  /_/   /_/  |_/____//_/  \____/\____/_____/_____/
 *
 *  http://www.inf.ethz.ch/personal/markusp/teaching/
 *  How to Write Fast Numerical Code 263-2300 - ETH Zurich
 *  Copyright (C) 2016  Alen Stojanov      (astojanov@inf.ethz.ch)
 *                      Daniele Spampinato (daniele.spampinato@inf.ethz.ch)
 *                      Singh Gagandeep    (gsingh@inf.ethz.ch)
 *	                Markus Pueschel    (pueschel@inf.ethz.ch)
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program. If not, see http://www.gnu.org/licenses/.
 */


#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>

#include "timer.h"

#include "comp.h"
#include "perf.h"
#include "verify.h"

#define TEST_RUNS  100


static int test_sizes[] = {100, 1000, 10000,100000, 1000000, 10000000};
static int test_iters[] = {10, 10, 10, 10, 10, 10};

#define NUM_TESTS (sizeof(test_sizes) / sizeof(int))

#define MIN(x,y) (((x) < (y)) ? (x) : (y))


double comp_ftimer_itimer(comp_func f, vector_t *vec2, vector_t *vec1, double *h, int n);
double get_perf_score(comp_func f, int size, int verbosity, int n);
double perf_test(comp_func f, char *desc, int verbosity);
void invalid_msg(int size, char *desc, int verbosity);

/* Global vars, used to keep track of student functions */
comp_func userFuncs[MAX_FUNCS];
char *funcNames[MAX_FUNCS];
int numFuncs = 0;

/*
 * Main driver routine - calls register_funcs to get student functions, then 
 * tests all functions registered, and reports the best performance
 */
int main(int argc, char **argv)
{
    double perf;
    double maxPerf = 0;
    int i;
    int maxInd = 0;
    int verbosity = 2;    
   
    register_functions();

    if(numFuncs == 0)
    {
        printf("No functions registered - nothing for driver to do\n");
        printf("Register functions by calling register_func(f, name)\n");
        printf("in register_funcs()\n");

        return 0;
    }
    
    for(i = 0; i < numFuncs; i++)
    {
        perf = perf_test(userFuncs[i], funcNames[i], verbosity);

        if(perf > maxPerf)
        {
            maxInd = i;
            maxPerf = perf;
        }
    }

    if(maxPerf > 0)
        printf("Best: %s\nPerf: %.3f MFLOPs\n", funcNames[maxInd], maxPerf);
    else
        printf("No valid functions registered\n"); 

    

    
    return 0;    
}

/*
 * Registers a user function to be tested by the driver program. Registers a
 * string description of the function as well
 */
void add_function(comp_func f, char *name)
{
    if(numFuncs >= MAX_FUNCS)
    {
        printf("Couldn't register %s, too many functions registered (Max: %d)",
                    name, MAX_FUNCS);
        return;
    }

    userFuncs[numFuncs] = f;
    funcNames[numFuncs] = name;

    numFuncs++;
}

/* 
 * Checks the given function for validity. If valid, then computes and 
 * reports and returns its performance in MFLOPs 
 * verbosity values <= 0 will suppress output, except for invalid result
 * warnings
 */
double perf_test(comp_func f, char *desc, int verbosity)
{
    double avg, results_sum;
    int test_size, test_iter;
    int i;
    
    if(verbosity > 0)
    {
        printf("%s:", desc);
        if(verbosity > 1)
            printf("\n");
    }
    
    results_sum = 0;
    for (i = 0; i < NUM_TESTS; i++) {
      test_size = test_sizes[i];
      test_iter = test_iters[i];
      if (! check_valid(f, test_size)) {
        invalid_msg(test_size, desc, verbosity);
        return 0;
      }
      results_sum += get_perf_score(f, test_size, verbosity, test_iter);
    }
    avg = results_sum / NUM_TESTS;
        
    if(verbosity > 0)
    {
        if(verbosity > 1)
            printf("Average:");
        printf(" %.3f flops/cycle\n\n", avg);
    }
            
    return avg; 
}

/* Prints a message when a function fails validation */
void invalid_msg(int size, char *desc, int verbosity)
{
    if(verbosity > 0)
        printf("Invalid result for size %d\n\n", size);
    else
        printf("Invalid result for %s (size %d)\n", desc, size);
}

/******************************************************************************/

/*
 * ftimer_itimer - Use the interval timer to estimate the running time
 * of f(argp). Return the average of n runs.
 */
double comp_ftimer_itimer(comp_func f, vector_t *vec2, vector_t * vec1, double *h, int n)
{
    myInt64 start, tmeas;
    int i;
    start = start_tsc();
    for (i = 0; i < n; i++)
        f(vec2,vec1,h);
    tmeas = stop_tsc(start);
    return tmeas / n;
}

/*
 * Gets the performance of a given function for a vector of a given size
 * Result is in MFLOPs
 * verbosity values <= 1 will suppress printing of results
 */
double get_perf_score(comp_func f, int size, int verbosity, int n)
{
    vector_t *vec1, *vec2;
    double result, mflops;
    double h[FILTER_SIZE];
    int i;
    for(i=0; i < FILTER_SIZE; i++){
	h[i] = RANDOM;
    }
    vec1 = random_vector(size);
    vec2 = alloc_vector(size);
    
    result = comp_ftimer_itimer(f, vec2,vec1,h, n);
    mflops = compute_flops(size)/result;

    if(verbosity > 1)
        printf("Size %d: flops/cycle %g\n", size, mflops);
    
    free_vector(vec1);
    free_vector(vec2);

    return mflops;
}
