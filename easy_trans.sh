#!/bin/bash
dir=$1
fileName=$2

files=$(ls $dir/$fileName*)
for fn in $files
do
    echo $fn
done
