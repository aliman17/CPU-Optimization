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
 *	                    Markus Pueschel    (pueschel@inf.ethz.ch)
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
#include <string.h>
#include <stdlib.h>
#include "main.h"
#include "validate.h"
#include "pointwise.h"

#define ALIGN 64

uint32_t notsorandom[] = {
        0x14200000, 0xDC840000, 0xF0DC8400, 0x84000000, 0x786E4200,
        0x23721000, 0x8DC84000, 0x1B908000, 0x37210000, 0x42000000,
        0xA1000000, 0x6E420000, 0x46E42000, 0x79080000, 0xF2100000,
        0x28400000, 0x11B90800, 0x50800000
};

void * aligned_malloc (int size) {
    void  * mem = malloc (size + ALIGN + sizeof(void *));
    void ** ptr = (void**)((uintptr_t)(mem + ALIGN + sizeof(void *)) & ~(ALIGN-1));
    ptr[-1] = mem;
    return ptr;
}

void aligned_free(void *ptr) {
    free(((void**)ptr)[-1]);
}

void test_group_1 () {
    int sizes[] = {1024, 1025, 1026, 1027, 1028, 1029, 1030, 1031};
    int sizesN = sizeof(sizes) / sizeof(sizes[0]);
    for (int nIdx = 0; nIdx < sizesN; nIdx += 1) {
        int n = sizes[nIdx] - ALIGN;
        float * a = (float *) aligned_malloc (sizeof(float) * n * 2);
        float * b = (float *) aligned_malloc (sizeof(float) * n * 2);
        float * c = (float *) aligned_malloc (sizeof(float) * n * 2);
        float tmp = 0.0;
        for (int i = 0; i < n; i += 1) {
            int re = 2 * i + 0;
            int im = 2 * i + 1;
            tmp += 1.0; a[re] = tmp;
            tmp += 1.0; a[im] = tmp;
            tmp += 1.0; b[re] = tmp;
            tmp += 1.0; b[im] = tmp;
        }
        validate(a, b, c, n);
        aligned_free(a);
        aligned_free(b);
        aligned_free(c);
    }
}

void test_group_2 () {

    int n = 1024 - ALIGN;
    float * a = (float *) aligned_malloc (sizeof(float) * (n + ALIGN) * 2);
    float * b = (float *) aligned_malloc (sizeof(float) * (n + ALIGN) * 2);
    float * c = (float *) aligned_malloc (sizeof(float) * (n + ALIGN) * 2);
    float tmp = 0.0;
    for (int i = 0; i < n + 4; i += 1) {
        int re = 2 * i + 0;
        int im = 2 * i + 1;
        tmp += 1.0; a[re] = tmp;
        tmp += 1.0; a[im] = tmp;
        tmp += 1.0; b[re] = tmp;
        tmp += 1.0; b[im] = tmp;
    }
    for (int i = 1; i < 4; i += 1) {
        for (int j = 1; j < 4; j += 1) {
            for (int k = 1; k < 4; k += 1) {
                validate(a + i, b + j, c + k, n);
            }
        }
    }
    aligned_free(a);
    aligned_free(b);
    aligned_free(c);
}


void test_group_3 () {
    srand(7919);
    int n = 1024;
    int len = sizeof(notsorandom) / sizeof(notsorandom[0]);
    float * a = (float *) aligned_malloc (sizeof(float) * n * 2);
    float * b = (float *) aligned_malloc (sizeof(float) * n * 2);
    float * c = (float *) aligned_malloc (sizeof(float) * n * 2);
    for (int i = 0; i < n; i += 1) {
        int re = 2 * i + 0;
        int im = 2 * i + 1;
        a[re] = ((float *)(notsorandom + (rand() % len)))[0];
        a[im] = ((float *)(notsorandom + (rand() % len)))[0];
        b[re] = ((float *)(notsorandom + (rand() % len)))[0];
        b[im] = ((float *)(notsorandom + (rand() % len)))[0];
    }
    validate(a, b, c, n);
    aligned_free(a);
    aligned_free(b);
    aligned_free(c);
}

int main (int argc, char * argv []) {

    if (argc > 1) {
        pointwise_init ((int)(argv[1][0] - '0'));
    } else {
        pointwise_init (0);
    }

    printf("Test Group 1\n");
    printf("========================================================\n");
    test_group_1 ();
    printf("\nTest Group 2\n");
    printf("========================================================\n");
    test_group_2 ();
    printf("\nTest Group 3\n");
    printf("========================================================\n");
    test_group_3 ();

    return 0;
}