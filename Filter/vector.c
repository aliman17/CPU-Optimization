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


#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <math.h>

#include "vector.h"

vector_t * alloc_vector(int n){
    vector_t *vec = malloc(sizeof(vector_t));
    double *v = malloc(n* sizeof(double));
    vec->v = v;
    vec->n = n;
    return vec;
}

/* returns a random vector with entries in [-1, 1] */
vector_t *random_vector(int n)
{
    int i;
    vector_t *vec = alloc_vector(n);
    for(i=0; i < n; i++)
    {
            vec->v[i] = RANDOM;	    
    }
    return vec;
}

/* Returns a deep copy of the give vector */
vector_t *copy_vector(vector_t *vec)
{
    int n = vec->n;
    size_t vec_size = n * sizeof(double);
    vector_t *nvec = malloc(sizeof(vector_t));
    
    nvec->n = vec->n;
    
    nvec->v = malloc(vec_size);

    memcpy(nvec->v, vec->v, vec_size);

    return nvec;
}

/* Frees all memory associated with the given vector */
void free_vector(vector_t *vector)
{
    free(vector->v);
    free(vector);
}

/* Prints the given vector to the terminal */
void print_vector(vector_t *vector)
{
    int i;
    int n = vector->n;
    double *v = vector->v;
    
    printf("\n\nvector of size: %d\n\n", n);

    for(i=0; i < n; i++)
    {
        printf("%g\t", v[i]);   
    }
    printf("\n");
}

