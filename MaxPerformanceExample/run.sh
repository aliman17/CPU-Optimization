#/bin/bash
g++ combine.c -o combine -fno-tree-vectorize -mno-abm
./combine

