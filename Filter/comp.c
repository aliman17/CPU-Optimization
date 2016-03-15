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
void fast_filter(vector_t *dst, vector_t *src, double *h){
	
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
	// Registers slow_filter with the driver
	add_function(&slow_filter, "slow_filter: original function");
	//add_function(&fast_filter, "fast_filter: optimized version 1");

	// Add your functions here
	// add_function(&fast_flter2, "fast_filter: Optimization X");


}
