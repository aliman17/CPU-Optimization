#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <sys/time.h>
#include <sys/resource.h>

#include "perf.h"

myInt64 meas_values[MAX_NUM_MEASUREMENTS];
int     meas_i = 0;
myInt64 meas_start = 0;
myInt64 meas_overhead = 0;

static void swap(myInt64 *x, myInt64 *y) {
    myInt64 temp;
    temp = *x;
    *x = *y;
    *y = temp;
}

/********************************************************************************/
// These can be used if we want to access the values of the perf. counters from our code

__attribute__((noinline)) void init_tsc() {
    ;
}

__attribute__((noinline)) myInt64 start_tsc(void) {
    tsc_counter start;
    CPUID();
    RDTSC(start);
    return COUNTER_VAL(start);
}

__attribute__((noinline)) myInt64 stop_tsc(myInt64 start) {
    tsc_counter end;
    RDTSC(end);
    CPUID();
    return COUNTER_VAL(end) - start;
}

__attribute__((noinline)) myInt64 get_tsc_overhead(void) {
    myInt64 t1, t2, t3, t;
    t = start_tsc(); stop_tsc(t);
    t = start_tsc(); stop_tsc(t);
    t = start_tsc(); stop_tsc(t);
    t1 = start_tsc(); t1 = stop_tsc(t1);
    t2 = start_tsc(); t2 = stop_tsc(t2);
    t3 = start_tsc(); t3 = stop_tsc(t3);
    if (t1 > t2)
        swap(&t1, &t2);
    if (t2 > t3)
        swap(&t2, &t3);
    if (t1 > t2)
        swap(&t1, &t2);
    return t2;
}

/********************************************************************************/
// These can be used if we don't care about the values of the perf. conters
// in our code and we just want the measurements to be written in measurements.txt

__attribute__((noinline)) void measurement_start(void) {
    tsc_counter start;
    CPUID();
    RDTSC(start);
    meas_start = COUNTER_VAL(start);
}

__attribute__((noinline)) void measurement_stop(void) {
    tsc_counter end;
    RDTSC(end);
    CPUID();
    meas_values[meas_i++] = COUNTER_VAL(end) - meas_start;
}

__attribute__((noinline)) myInt64 get_measurement_overhead(void) {
    myInt64 t1, t2, t3;
    int init_i = meas_i;
    measurement_start(); measurement_stop();
    measurement_start(); measurement_stop();
    measurement_start(); measurement_stop();
    measurement_start(); measurement_stop();
    measurement_start(); measurement_stop();
    measurement_start(); measurement_stop();
    t1 = meas_values[init_i]; t2 = meas_values[init_i + 1]; t3 = meas_values[init_i + 2];
    if (t1 > t2)
        swap(&t1, &t2);
    if (t2 > t3)
        swap(&t2, &t3);
    if (t1 > t2)
        swap(&t1, &t2);
    meas_i = init_i;
    return t2;
}

__attribute__((noinline)) void measurement_init(void) {
    meas_i = 0;
    meas_overhead = get_measurement_overhead();
}

int cmpMyInt64(const void * a, const void * b) {
    return ( *(myInt64*)a - *(myInt64*)b );
}

__attribute__((noinline)) void measurement_finish(myInt64 * values) {
    int i;
    for (i = 0; i < meas_i; i++) {
        values[i] = meas_values[i] - meas_overhead;
    }
}

