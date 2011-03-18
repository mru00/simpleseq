#! /bin/bash

for i in `seq 100`; do
	echo $((1+$RANDOM %9)) $((5+$RANDOM %10))
done > random.txt
