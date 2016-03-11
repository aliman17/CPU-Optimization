#!/bin/bash
# Compile matrix multiplication
g++ MatrixMultiplication.c -o run -fno-tree-vectorize -mno-abm

# Run Matrix multiplication, extract measured cycles with
# grep (extracts all numbers from the input)
# head (head returns first line of the input)
# Do that for 15 values and append to the file result.txt
output=performanceResult.txt

rm $output 2>/dev/null  # remove output if it exists

for i in {1..15}
do
	./run $((100*i)) | grep -Eo '[0-9]+\.[0-9]*' | head -1 >> $output
done

cat $output

