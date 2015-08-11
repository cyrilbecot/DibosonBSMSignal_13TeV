#!/bin/bash

scriptname=`basename $0`
EXPECTED_ARGS=4

if [ $# -ne $EXPECTED_ARGS ]
then
    echo "Usage: $scriptname generationScript currentDirectory processName massinputFile"
    echo "Example: ./$scriptname Radion_hh_generation.sh $PWD Radion_hh_hbbhbb $PWD/mass_points"
    exit 1
fi

iteration=0
lastfile=`cat $4 | wc -l`
echo "There are "$lastfile" mass points"

while [ $iteration -lt $lastfile ]; 
do
  iteration=$(( iteration + 1 ))
  mass=(`head -n $iteration $4  | tail -1`)
  echo "Submitting jobs for X mass = "$mass" GeV"
  bsub -q1nw $2/$1 $2 $3 $mass
done
