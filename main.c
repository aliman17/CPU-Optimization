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

#include "cpuid.h"
#include "detect.h"
#include "util.h"

void printStringInfo (char * label, char * value) {
    printf("%20s : %s\n", label, trim(value));
    free(value);
}

void printIntInfo (char * label, int value) {
    printf("%20s : %d\n", label, value);
}

char * getFeaturedFlags () {

    int offset = 0;
    char * buffer = (char * ) malloc (sizeof(char) * 1024);

    if (hasSSE   ()) offset += sprintf(buffer + offset, "SSE ");
    if (hasSSE2  ()) offset += sprintf(buffer + offset, "SSE2 ");
    if (hasSSE3  ()) offset += sprintf(buffer + offset, "SSE3 ");
    if (hasSSSE3 ()) offset += sprintf(buffer + offset, "SSSE3 ");
    if (hasSSE41 ()) offset += sprintf(buffer + offset, "SSE41 ");
    if (hasSSE42 ()) offset += sprintf(buffer + offset, "SSE42 ");
    if (hasAVX   ()) offset += sprintf(buffer + offset, "AVX ");
    if (hasAVX2  ()) offset += sprintf(buffer + offset, "AVX2 ");


    buffer[offset] = '\0';
    return buffer;
}

/**
 *  cpuid returns CPU information. A typical output should provide the
 *  following information:
 *
 *           vendor_id : GenuineIntel
 *              family : 6
 *               model : 58
 *          brand name : Intel(R) Core(TM) i7-3720QM CPU @ 2.60GHz
 *               flags : SSE SSE2 SSE3 SSSE3 SSE41 SSE42 AVX
 */
int main (int argc, char * argv []) {
    printStringInfo("vendor_id" , getVendorID()      );
    printIntInfo   ("family"    , getFamily()        );
    printIntInfo   ("model"     , getModel()         );
    printStringInfo("brand name", getBrandName()     );
    printStringInfo("flags"     , getFeaturedFlags() );
    return 0;
}