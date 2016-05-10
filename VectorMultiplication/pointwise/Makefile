#      _________   _____________________  ____  ______
#     / ____/   | / ___/_  __/ ____/ __ \/ __ \/ ____/
#    / /_  / /| | \__ \ / / / /   / / / / / / / __/
#   / __/ / ___ |___/ // / / /___/ /_/ / /_/ / /___
#  /_/   /_/  |_/____//_/  \____/\____/_____/_____/
#
#  http://www.inf.ethz.ch/personal/markusp/teaching/
#  How to Write Fast Numerical Code 263-2300 - ETH Zurich
#  Copyright (C) 2016  Alen Stojanov      (astojanov@inf.ethz.ch)
#                      Daniele Spampinato (daniele.spampinato@inf.ethz.ch)
#                      Singh Gagandeep    (gsingh@inf.ethz.ch)
#	                   Markus Pueschel    (pueschel@inf.ethz.ch)
#
#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program. If not, see http://www.gnu.org/licenses/.


# ==================================================================================== #
# = Folder structure / tests
# ==================================================================================== #

CC     = gcc
EXEC   = pointwise
INCDIR = include
LIBDIR = lib
BINDIR = bin
SRCDIR = src

# ==================================================================================== #
# = Compiler settings
# ==================================================================================== #

AFLAGS = -O3
DFLAGS = -g -Wall
LIBS   = -lm

# ==================================================================================== #
# = Default targets
# ==================================================================================== #

TARGET = $(BINDIR)/$(EXEC)

CFLAGS += -std=c99 -I$(INCDIR)/ $(MACROS)

LIBOBJ  = $(BINDIR)/main.o \
          $(BINDIR)/perf.o \
          $(BINDIR)/cpuid.o \
          $(BINDIR)/validate.o

SRCOBJ  = $(BINDIR)/pointwise.o

COREOBJ = $(BINDIR)/pointwise_SSE.o \
          $(BINDIR)/pointwise_AVX.o \
          $(BINDIR)/pointwise_FMA.o

$(BINDIR)/%.o : $(SRCDIR)/%.c $(INCDIR)/%.h
	$(CC) -c $(AFLAGS) $(DFLAGS) $(CFLAGS) $< -o $@

$(BINDIR)/%.o : $(LIBDIR)/%.c $(INCDIR)/%.h
	$(CC) -c $(CFLAGS) $< -o $@

all: $(LIBOBJ) $(SRCOBJ) CORE
	$(CC) $(LIBOBJ) $(SRCOBJ) $(COREOBJ) $(LIBS) -o $(TARGET)

CORE:
	$(CC) -c -march=core2            $(AFLAGS) $(DFLAGS) $(CFLAGS) $(SRCDIR)/pointwise_SSE.c -o $(BINDIR)/pointwise_SSE.o
	$(CC) -c -march=corei7-avx       $(AFLAGS) $(DFLAGS) $(CFLAGS) $(SRCDIR)/pointwise_AVX.c -o $(BINDIR)/pointwise_AVX.o
	$(CC) -c -march=core-avx-i -mfma $(AFLAGS) $(DFLAGS) $(CFLAGS) $(SRCDIR)/pointwise_FMA.c -o $(BINDIR)/pointwise_FMA.o
clean:
	rm -rf $(LIBOBJ)
	rm -rf $(SRCOBJ)
	rm -rf $(TARGET)
	rm -rf $(COREOBJ)
