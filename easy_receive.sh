#!/bin/bash
fileName=$1
num=$2

for idx in `seq 1 $num`
do
    #echo $fileName\#\$\#$idx
    exec ndncutchunks $fileName\#\$\#$idx &
done

wait
