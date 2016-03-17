#/bin/bash
gcc -S combine.c  # assembley
g++ combine.c -O3 -o combine -fno-tree-vectorize -mno-abm
./combine

python ./performanceResults.py > performanceResults.txt
cat performanceResults.txt
