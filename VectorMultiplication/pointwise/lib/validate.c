#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "perf.h"
#include "pointwise.h"

int validate_test_count = 0;

void print_complex(float re, float im) {
    if (im < 0) {
        printf("%08.2lf - %08.2lf", re, im * (-1));
    } else {
        printf("%08.2lf + %08.2lf", re, im);
    }
}

void print_error(float * a, float * b, float * c, float * c_valid, int n, int eIdx) {
    for (int i = 0; i < n; i += 1) {
        int re = 2 * i + 0;
        int im = 2 * i + 1;
        printf("%07d:\t", i + 1);
        print_complex(a[re], a[im]);
        printf("\t*\t");
        print_complex(b[re], b[im]);
        printf("\t=\t");
        print_complex(c[re], c[im]);
        printf("\t/\t");
        print_complex(c_valid[re], c_valid[im]);
        printf("\n");
    }
    printf("\n\nError occurs at position: %d\n", eIdx + 1);
}

int cmp_vectors (float * a, float * b, int n) {
    int errorPos = -1;
    for (int i = 0; i < 2 * n; i += 1) {
        if (((uint32_t *) a)[i] != ((uint32_t *) b)[i]) {
            errorPos = i;
            break;
        }
    }
    return errorPos;
}


void validate (float * a, float * b, float * c, int n) {

    int runs = 10, repetitions = 10;
    myInt64 values[repetitions];
    memset(c, 0, sizeof(myInt64) * repetitions);
    myInt64 sisd_cycles = 0, simd_cycles = 0;

    float * c_valid = (float *) malloc(sizeof(float) * n * 2);

    memset(c, 0, sizeof(float) * n * 2);
    measurement_init();
    for (int i = 0; i < repetitions; ++i) {
        measurement_start();
        for (int j = 0; j < runs; ++j) {
            pointwise_sisd (a, b, c, n);
        }
        measurement_stop();
        meas_values[i] = meas_values[i] / runs;
    }
    measurement_finish(values);
    qsort(values, repetitions, sizeof(myInt64), cmpMyInt64);
    sisd_cycles = values[repetitions / 2];

    memcpy(c_valid, c, sizeof(float) * n * 2);

    memset(c, 0, sizeof(float) * n * 2);
    measurement_init();
    for (int i = 0; i < repetitions; ++i) {
        measurement_start();
        for (int j = 0; j < runs; ++j) {
            pointwise_simd (a, b, c, n);
        }
        measurement_stop();
        meas_values[i] = meas_values[i] / runs;
    }
    measurement_finish(values);
    qsort(values, repetitions, sizeof(myInt64), cmpMyInt64);
    simd_cycles = values[repetitions / 2];

    int cmp = cmp_vectors(c, c_valid, n);
    validate_test_count += 1;
    if (cmp == -1) {
        double flops = n * 6;
        printf("Test %02d: OK, ", validate_test_count);
        printf("SISD %05.4lf, ", flops / sisd_cycles);
        printf("SIMD %05.4lf\n", flops / simd_cycles);
    } else {
        printf("Test %02d: Fail\n", validate_test_count);
        print_error(a, b, c, c_valid, n, cmp);
    }

    free(c_valid);
}
