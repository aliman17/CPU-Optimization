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

#ifndef __VECTOR_H
#define __VECTOR_H

#include <stdlib.h>

typedef struct vector
{
    double *v;
    int n;
} vector_t;

#define RANDOM (((double)rand()) / RAND_MAX * 20)     /* Random number             */

#define FILTER_SIZE 30 
/* Allocate a vector of given size */
vector_t * alloc_vector(int n);

/* Generates a random vector of the given size */
vector_t *random_vector(int n);

/* Returns a deep copy of the given vector */
vector_t *copy_vector(vector_t *orig);

/* Frees all memory associated with the given vector */
void free_vector(vector_t *vector);

/* Prints the given vector to the terminal */
void print_vector(vector_t *vector);


#endif /* __vector_H */
