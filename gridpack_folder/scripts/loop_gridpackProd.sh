#!/bin/bash

scriptname=`basename $0`
EXPECTED_ARGS=4

if [ $# -ne $EXPECTED_ARGS ]
then
    echo "Usage: $scriptname currentDirectory processName massinputFile dirName"
    echo "Example: ./$scriptname $PWD Radion_hh_hbbhbb $PWD/mass_points cards"
    exit 1
fi

iteration=0
massfile=$3
lastfile=`cat $massfile | wc -l`
echo "There are "$lastfile" mass points"

while [ $iteration -lt $lastfile ]; 
do
  iteration=$(( iteration + 1 ))
  mass=(`head -n $iteration $massfile  | tail -1`)
  echo "Generating gridpack for X mass = "$mass" GeV"
  process=${2}_narrow_M$mass
  echo $process
  dir=$4/$2/$process
  ls $dir
#  echo $1, $process, $dir
  bsub -q2nd $PWD/runJob.sh $1 $process $dir
done
