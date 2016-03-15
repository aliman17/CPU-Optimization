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
#include "verify.h"
#include "vector.h"
#include "verfunc.h"

#define EPS (1e-3)

/*
 * Checks whether or not the results of two computation functions are the
 * same (within a tolerance defined by EPS, to deal with rounding issues
 */
int check_valid(comp_func checkFunc, int chk_n)
{
    int i;
    
    int valid = 1;
    double h[FILTER_SIZE];
    for(i=0; i < FILTER_SIZE; i++){
	h[i] = RANDOM;
    }
    vector_t *vec1 = random_vector(chk_n);
    vector_t *vec2 = alloc_vector(chk_n); 
    
    vector_t *vec3 = copy_vector(vec1);    
    vector_t *vec4 = alloc_vector(chk_n); 
    
    verfunc(vec2,vec1,h);
    checkFunc(vec4,vec3,h);
    
    for(i = 0; i < chk_n; i++)
    { 
      if (! (fabs(vec4->v[i] - vec2->v[i]) < EPS)) {
	valid = 0;
	break;
      }
    }

    free_vector(vec1);
    free_vector(vec2); 
    free_vector(vec3);
    free_vector(vec4);    
    return valid;
}


