#!/bin/bash

scriptname=`basename $0`
EXPECTED_ARGS=3

if [ $# -ne $EXPECTED_ARGS ]
then
    echo "Usage: $scriptname currentDirectory processName massinputFile"
    echo "Example: ./$scriptname $PWD Zprime_Zh_Zlephbb $PWD/mass_points"
    exit 1
fi

iteration=0
lastfile=`cat $3 | wc -l`
echo "There are "$lastfile" mass points"

while [ $iteration -lt $lastfile ]; 
do
  iteration=$(( iteration + 1 ))
  mass=(`head -n $iteration $3  | tail -1`)
  echo "Submitting jobs for X mass = "$mass" GeV"
  bsub -q2nd $1/signal_generation.sh $1 $2 $mass
done
