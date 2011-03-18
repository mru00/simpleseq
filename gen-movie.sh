#!/bin/bash -e

FPS=12
NIMAGES=9

# mru, 2011-02

program_to_file_list() {
	while read frame length; do 
		for i in `seq $((length))`; do 
			printf 's_%02d.jpg\n' $frame
		done
	done
}


fromfile() {
	command grep -e '[0-9]\+[ ]\+[0-9]\+' program.txt
}

random() {
	for i in `seq 50`; do
		echo $((1+($RANDOM % NIMAGES))) $((5+($RANDOM %10)))
	done
}

gen_movie_from_list() {
	./jpeg2yuv -v 0 -I p -f $FPS | yuv2lav -o movie.avi
}


(random | program_to_file_list ) | gen_movie_from_list

