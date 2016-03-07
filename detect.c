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


/* Implementation of functions made by Ales Omerzel */

#include <string.h>
#include <stdio.h>
#include "cpuid.h"
#include "detect.h"

/**
 * The vendor ID of the CPU. For example: GenuineIntel
 *
 * Note that the string must be malloc-ed before return.
 */
char * getVendorID () {
    // eax = 0, to get vendor id in ebx edx ecx (in this orther)
    // The result in these 3 registers is a string of lenght 12

    // Allocate memory for the vendor ID
    char * vendorID = malloc (sizeof(char) * (12 + 1));
    // Set eax to 0, which means to set function number to 0
    int functionNumber = 0;
    // Get registers eax, ebx, ecx and edx in the structure regs
	cpuid_t regs = cpuid(functionNumber);
    // Cast char pointer to int pointer that we can store 
    // values of registers to vendorID memory allocation.
    // Registers are unsigned int 32 bits. 
    int * ptr = (int *)vendorID;
    // Store registers' values into vendorID. The order is 
    // ebx, edx and then ecx. Look at the wikipedia for 'cpuid'.
    *ptr = regs.ebx;
    ptr++;
    *ptr = regs.edx;
    ptr++;
    *ptr = regs.ecx;
    ptr++;
    // Add termination character to complee the string for 
    // vendor ID
    vendorID[12] = '\0';
    //strcpy(vendorID, "UNKNOWN");
    return vendorID;
}

/**
 *  Get the model number. For Intel(R) Core(TM) i7-3720QM
 *  this function should return: 58 (0x3A)
 */
int getModel () {
    // To get CPU model, eax register value has to be 1.
    // So the function number is 1.
    int functionNumber = 1;
    // Get values of registers, based on function number
    cpuid_t regs = cpuid(functionNumber);
    // Parse register eax and extract 7:4 bits to get the
    // model number
    int model = (regs.eax >> 4) & 0x7;
    return model;
}

/**
 *  Get the CPU family. For Intel(R) Core(TM) i7-3720QM
 *  this function should return: 6 (0x06)
 */
int getFamily () {
    // To get a CPU family, eax register value has to be 1.
    // So the function number is 1
    int functionNumber = 1;
    // Get values of registers based on function number
    cpuid_t regs = cpuid(functionNumber);
    // Parse eax register and extract 11:8 bits ro get the
    // family number 
    int family = (regs.eax >> 8) & 0x7;
    return family;
}


/**
 *  The brand name returns the string of the computer mode.
 *  For example: Intel(R) Core(TM) i7-3720QM CPU @ 2.60GHz
 *
 *  Note that the string must be malloc-ed before return.
 */
char * getBrandName () {
    // First, check if the feature is supported. Then, get
    // the brand name

    // This is a number for eax register to check if brand
    // name query is supported
    int checkSupportQuery = 0x80000000;
    // If the result of the query in eax is higher then 
    // supportBound then the feature for brand name is supported
    int supportBound = 0x80000004;
    // To query brand name, the following number has to be
    // send to cpuid in register eax
    int brandNameQueries[3] = {0x80000002, 0x80000003, 0x80000004};
    int brandNameQueriesLength = 3;

    // Allocate mamory for brand name string
    char * brandName = malloc (sizeof(char) * 48);

    // Query, if the feature is supported
    cpuid_t regs = cpuid(checkSupportQuery);
    // The result is returned in eax
    int isSupportedResult = regs.eax;
    // If the result is higher than supportBound, then we can
    // get the brand name
    if (isSupportedResult >= supportBound) {
        // Now, query for the brand name
        // Initialize a moving pointer
        int * ptr = (int*)brandName;
        // Run over all given queries (in our case three) and 
        // store the result into brandName using a moving pointer
        int i;
        int j;
        for (i = 0; i < brandNameQueriesLength; i++) {
            // Query and store the result into registers
            regs = cpuid(brandNameQueries[i]);
            // Put registers into an array that we can run through it
            // in a loop
            int array[4] = {regs.eax, regs.ebx, regs.ecx, regs.edx};
            int arrayLength = 4;
            // Copy registers' values into branName string allocation
            for (j = 0; j < arrayLength; j++, ptr++){
                *ptr = array[j];
            }
        }
    } 
    else
        strcpy(brandName, "UNKNOWN");
    return brandName;
}


/* 
 * Parse bit from specified register and position of
 * a query where eax is set to function number. 
 * To specify register use the following notation: 
 * 0:eax, 1:ebx, 2:ecx, 3:edx
 */
int getFlag (int functionNumber, int regNum, int bitPosition){
    // query with eax=functionNumber
    cpuid_t regs = cpuid(functionNumber);  // query and fill regs
    uint32_t reg;
    switch (regNum){
        case 0: reg = regs.eax; break; 
        case 1: reg = regs.ebx; break;
        case 2: reg = regs.ecx; break;
        case 3: reg = regs.edx; break;
        default: reg = 0;
    }
    int flag = (reg >> bitPosition) & 0x1; // extract selected bit
    return flag;
}

/* 
 * Parse bit from specified register and position of
 * a query where eax is 1. To specify register use the
 * following notation: 0:eax, 1:ebx, 2:ecx, 3:edx
 */
int getFlagEax1 (int regNum, int bitPosition){
    // query with eax=1
    int functionNumber = 1;
    int flag = getFlag(functionNumber, regNum, bitPosition);
    return flag;
}




/*
 * 1 or 0, whether this feature is available or not
 */
int hasSSE () {
    // query with eax=1, result in edx bit 25 (counting from 0)
    int functionNumber = 1;      // query number (look wikipedia for cpuid)
    cpuid_t regs = cpuid(functionNumber);   // query and fill regs
    int has_sse = (regs.edx >> 25) & 0x1;   // parse bit 25
    return has_sse;
}

/*
 * 1 or 0, whether this feature is available or not
 */
int hasSSE2 () {
    // query with eax=1, result in edx bit 26 (counting from 0)
    int has_sse2 = getFlagEax1(3, 26);
    return has_sse2;
}

/*
 * 1 or 0, whether this feature is available or not
 */
int hasSSE3 () {
    // Let's use fast function
    // sse3 is in ecx register (=2), position bit is 0
    int has_sse3 = getFlagEax1(2, 0);
    return has_sse3;
}

/*
 * 1 or 0, whether this feature is available or not
 */
int hasSSSE3 () {
    // ssse3 is in ecx register (=2), position bit is 9
    int has_ssse3 = getFlagEax1(2, 9);
    return has_ssse3;
}

/*
 * 1 or 0, whether this feature is available or not
 */
int hasSSE41 () {
    // sse41 is in ecx register (=2), position bit is 19
    int has_sse41 = getFlagEax1(2, 19);
    return has_sse41;
}

/*
 * 1 or 0, whether this feature is available or not
 */
int hasSSE42 () {
    // sse42 is in ecx register (=2), position bit is 20
    int has_sse42 = getFlagEax1(2, 20);
    return has_sse42;
}

/*
 * 1 or 0, whether this feature is available or not
 */
int hasAVX () {
    // avx is in ecx register (=2), position bit is 28
    int has_avx = getFlagEax1(2, 28);
    return has_avx;
}

/*
 * 1 or 0, whether this feature is available or not
 */
int hasAVX2 () {
    // avx2 is in ecx register (=2), position bit is 5
    // but now we need to use eax=7
    int has_avx2 = getFlag(7, 2, 5);
    return has_avx2;

// For info look at: https://en.wikipedia.org/wiki/CPUID#EAX.3D0:_Get_vendor_ID
}
