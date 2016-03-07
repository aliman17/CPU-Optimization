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
#

# ==================================================================================== #
# = Executable
# ==================================================================================== #

BIN = cpuid

# ==================================================================================== #
# = Compiler settings
# ==================================================================================== #

CC      = gcc
CFLAGS += -O3 -std=c99 -Wall
LIBS   +=

# ==================================================================================== #
# = Object Files
# ==================================================================================== #

%.o : %.c %.h
	$(CC) $(CFLAGS) -c $< -o $@

%.s : %.c
	$(CC) $(CFLAGS) -S $< -o $@

SRCS=$(wildcard *.c)

OBJS=$(SRCS:.c=.o)

all: $(OBJS)
	$(CC) $(OBJS) $(LIBS) -o $(BIN)

clean:
	rm -rf *.o
	rm -rf $(BIN)


