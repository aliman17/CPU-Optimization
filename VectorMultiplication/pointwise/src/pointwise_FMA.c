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

#include <stdint.h>
#include <immintrin.h>

void pointwise_FMA_init () {

}

void pointwise_FMA (float* x0, float* x1, float* x2, int32_t i3)
{

    // Implement your FMA solution here

    for (int32_t i4 = 0; i4 < i3; i4 = i4 + (1)) {
        int32_t i5 = i4 * 2;
        float x6 = x0[i5];
        float x9 = x1[i5];
        float x11 = x6 * x9;
        int32_t i7 = i5 + 1;
        float x8 = x0[i7];
        float x10 = x1[i7];
        float x12 = x8 * x10;
        float x15 = x11 - x12;
        float x13 = x6 * x10;
        float x14 = x8 * x9;
        float x16 = x13 + x14;
        x2[i5] = x15;
        x2[i7] = x16;
    }
}
