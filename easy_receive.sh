#!/bin/bash
fileName=$1
num=$2

for idx in `seq 1 $num`
do
    #echo $fileName\#\$\#$idx
    exec ndncatchunks /home/node0/Documents/CCNDeployment/xu/$fileName\#\$\#$idx &
done

wait
