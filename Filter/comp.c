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


#include <math.h>
#include <stdio.h>
#include "comp.h"
#include "perf.h"


//measure the flops
long int compute_flops(int n){
   long int count = 0;
   int m,j;
   for(m=0; m < n; m++){
	for(j=0; j < FILTER_SIZE && (m-j)>=0; j++){
		count = count+2;
	}
   }
   return count;
}


//write your optimized code here

/*
	Higher unrolling factor
*/
void fast_filter4(vector_t *dst, vector_t *src, double *h){
	double * y = dst->v;
	double * x = src->v;
	int n = src->n;
	int m,j;
	// initialize
	for(m=0; m < n-1; m+=2){
		y[m] = 0;
		y[m+1] = 0;
	}
	y[n-1] = 0;

	// set new limits for inner loop
	int limit1 = FILTER_SIZE-3;
	int limit2 = 3;

	double tmp_ym;		// variable for y[m]
	double tmp_ym1;		// variable for y[m+1]
	//double tmp_ym2;		// variable for y[m+2]
	//double tmp_ym3;		// variable for y[m+3]
	double tmp_xmj;		// variable for x[m-j]
	double tmp_xmj1;	// variable for x[m-j-1]
	double tmp_xmj2;	// variable for x[m-j-2]
	double tmp_xmj3;	// variable for x[m-j-3]
	double tmp_hj;		// variable for h[j]
	double tmp_hj1;		// variable for h[j+1]
	double tmp_hj2;		// variable for h[j+2]
	double tmp_hj3;		// variable for h[j+3]
	int tmp_j;		// variable to copy j

	for(m=0; m < n-1; m+=2){

		tmp_ym = y[m];
		tmp_ym1 = y[m+1];
		//tmp_ym2 = y[m+2];
		//tmp_ym3 = y[m+3];

		for(j=0; j < limit1 && (m-j)>=limit2; j+=4){
			tmp_xmj = x[m-j];
			tmp_xmj1 = x[m-j-1];
			tmp_xmj2 = x[m-j-2];
			tmp_xmj3 = x[m-j-3];
			tmp_hj = h[j];
			tmp_hj1 = h[j+1];
			tmp_hj2 = h[j+2];
			tmp_hj3 = h[j+3];
			// base m
			tmp_ym = tmp_ym + tmp_hj*tmp_xmj + tmp_hj1*tmp_xmj1 + tmp_hj2*tmp_xmj2 + tmp_hj3*tmp_xmj3;
			// parallel m+1			
			tmp_ym1 = tmp_ym1 + tmp_hj*x[m+1-j] + tmp_hj1*tmp_xmj + tmp_hj2*tmp_xmj1 + tmp_hj3*tmp_xmj2;
			
		}
		tmp_j = j;	// copy j that we can use it in the next loop for m+1
		// finish loop for j while having m
		for (; j < FILTER_SIZE && (m-j)>=0; j++){
			tmp_ym = tmp_ym + h[j]*x[m-j];
		}
		// finish loop for j while having m+1 (parallel)
		for (j = tmp_j; j < FILTER_SIZE && (m+1-j)>=0; j++){
			tmp_ym1 = tmp_ym1 + h[j]*x[m+1-j];
		}
		// store both results into memory
		y[m] = tmp_ym;
		y[m+1] = tmp_ym1; 	
	}
	// finish m: there will be one or zero iterations of this loop
	for(; m < n; m++){

		tmp_ym = y[m];

		// do parallel for j again
		for(j=0; j < limit1 && (m-j)>=limit2; j+=2){
			tmp_ym = tmp_ym + h[j]*x[m-j] + h[j+1]*x[m-j-1];
		}
		// finish j if something left
		for (; j < FILTER_SIZE && (m-j)>=0; j++){
			tmp_ym = tmp_ym + h[j]*x[m-j];
		}
		y[m] = tmp_ym;	
	}
}

/*
	Unroll both loops
*/
void fast_filter3(vector_t *dst, vector_t *src, double *h){
	double * y = dst->v;
	double * x = src->v;
	int n = src->n;
	int m,j;
	// initialize
	for(m=0; m < n-1; m+=2){
		y[m] = 0;
		y[m+1] = 0;
	}
	y[n-1] = 0;

	// set new limits for inner loop
	int limit1 = FILTER_SIZE-1;
	int limit2 = 1;

	double tmp_ym;		// variable for y[m]
	double tmp_ym1;		// variable for y[m+1]
	double tmp_xmj;		// variable for x[m-j]
	double tmp_hj;		// variable for h[j]
	double tmp_hj1;		// variable for h[j+1]
	int tmp_j;		// variable to copy j

	for(m=0; m < n-1; m+=2){

		tmp_ym = y[m];
		tmp_ym1 = y[m+1];

		for(j=0; j < limit1 && (m-j)>=limit2; j+=2){
			tmp_xmj = x[m-j];
			tmp_hj = h[j];
			tmp_hj1 = h[j+1];
			// base m
			tmp_ym = tmp_ym + tmp_hj*tmp_xmj + tmp_hj1*x[m-j-1];
			// parallel m+1			
			tmp_ym1 = tmp_ym1 + tmp_hj*x[m+1-j] + tmp_hj1*tmp_xmj;
		}
		tmp_j = j;	// copy j that we can use it in the next loop for m+1
		// finish loop for j while having m
		for (; j < FILTER_SIZE && (m-j)>=0; j++){
			tmp_ym = tmp_ym + h[j]*x[m-j];
		}
		// finish loop for j while having m+1 (parallel)
		for (j = tmp_j; j < FILTER_SIZE && (m+1-j)>=0; j++){
			tmp_ym1 = tmp_ym1 + h[j]*x[m+1-j];
		}
		// store both results into memory
		y[m] = tmp_ym;
		y[m+1] = tmp_ym1; 	
	}
	// finish m: there will be one or zero iterations of this loop
	for(; m < n; m++){

		tmp_ym = y[m];

		// do parallel for j again
		for(j=0; j < limit1 && (m-j)>=limit2; j+=2){
			tmp_ym = tmp_ym + h[j]*x[m-j] + h[j+1]*x[m-j-1];
		}
		// finish j if something left
		for (; j < FILTER_SIZE && (m-j)>=0; j++){
			tmp_ym = tmp_ym + h[j]*x[m-j];
		}
		y[m] = tmp_ym;	
	}
}

/* 
	Unroll outer loop
*/
void fast_filter2(vector_t *dst, vector_t *src, double *h){
	double * y = dst->v;
	double * x = src->v;
	int n = src->n;
	int m,j;
	for(m=0; m < n-1; m+=2){
		y[m] = 0;
		y[m+1] = 0;
	}
	y[n-1] = 0;

	// do parallel for m
	for(m=0; m < n-1; m+=2){
		for(j=0; (j < FILTER_SIZE) && (m-j)>=0; j++){
			y[m] = y[m] + h[j]*x[m-j]; 
			y[m+1] = y[m+1] + h[j]*x[m+1-j]; 
		}
		// condition (m-j) doesn't hold for (m+1-j)>=0, so we need this patch
		for(; (j < FILTER_SIZE) && (m+1-j)>=0; j++){
			y[m+1] = y[m+1] + h[j]*x[m+1-j];
		}
	}
	// finish m: there will be one or zero iterations of this loop

	for(; m < n; m++){
		for(j=0; (j < FILTER_SIZE) && (m-j)>=0; j++){
			y[m] = y[m] + h[j]*x[m-j]; 
		}	
	}
}

/*
	Unroll inner loop
*/
void fast_filter1(vector_t *dst, vector_t *src, double *h){
	double * y = dst->v;
	double * x = src->v;
	int n = src->n;
	int m,j;
	for(m=0; m < n-1; m+=2){
		y[m] = 0;
		y[m+1] = 0;
	}
	y[n-1] = 0;

	int limit1 = FILTER_SIZE-1;
	int limit2 = 1;
	double tmp_ym;
	for(m=0; m < n; m++){
		tmp_ym = y[m];
		for(j=0; j < limit1 && (m-j)>=limit2; j+=2){
			tmp_ym = tmp_ym + h[j]*x[m-j];
			tmp_ym = tmp_ym + h[j+1]*x[m-j-1]; 
		}
		for (; j < FILTER_SIZE && (m-j)>=0; j++)
			tmp_ym = tmp_ym + h[j]*x[m-j];
		y[m] = tmp_ym; 	
	}
}


/* 
slow filter:
This is the function you need to optimize. It takes two vectors and a filter as input
*/
void slow_filter(vector_t *dst, vector_t *src, double *h){
	double * y = dst->v;
	double * x = src->v;
	int n = src->n;
	int m,j;
	for(m=0; m < n; m++){
		y[m] = 0;
	}

	for(m=0; m < n; m++){
		for(j=0; j < FILTER_SIZE && (m-j)>=0; j++){
			y[m] = y[m] + h[j]*x[m-j]; 
		}
	}
}


/* 
* Called by the driver to register your functions
* Use add_function(func, description) to add your own functions
*/
void register_functions()
{
	
	//add_function(&slow_filter, "fast_filter: optimized version 1");

	// Add your functions here
	add_function(&fast_filter4, "fast_filter: Optimization 4 (Unroll both loops + unroll factor 4)");
	add_function(&fast_filter3, "fast_filter: Optimization 3 (Unroll both loops)");
	add_function(&fast_filter2, "fast_filter: Optimization 2 (Unroll outer loop)");
	add_function(&fast_filter1, "fast_filter: Optimization 1 (Unroll inner loop)");
	
	// Registers slow_filter with the driver
	add_function(&slow_filter, "slow_filter: original function"); 

}
