#!/bin/bash
fileName=$1

files=$(ls ~/Documents/CCNDeployment/xu/$fileName*)
for fn in $files
do
    exec ndnputchunks $fn &
done

wait
