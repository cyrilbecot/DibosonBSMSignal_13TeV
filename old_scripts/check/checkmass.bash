#!/bin/bash

scriptname=`basename $0`
EXPECTED_ARGS=2

if [ $# -ne $EXPECTED_ARGS ]
then
    echo "Usage: $scriptname processName massinputFile"
    echo "Example: ./$scriptname Radion_hh_hbbhbb $PWD/mass_points"
    exit 1
fi

iteration=0
lastfile=`cat $2 | wc -l`
echo "There are "$lastfile" mass points"

while [ $iteration -lt $lastfile ]; 
do
  iteration=$(( iteration + 1 ))
  mass=(`head -n $iteration $2  | tail -1`)
  file=$1/$1_M$mass\_narrow.lhe

#  number=`grep -a "MH02" $file | grep -a $mass | wc -l` 
#  number=`grep -a "9000002" $file | grep -a "vc+ : cmath" | grep -a $mass | wc -l` 
  number=`grep -a "MGr" $file | grep -a $mass | wc -l` 
#  echo $number
  if [ $((number)) -ne 1 ]; then 
      echo $file "has a problem. number = " $number
  fi

#  ratio=`grep -a "35    2    1    2" $file | awk '{print $11/'$mass'}' | head -1`
#  ratio=`grep -a "9000002    2    1    2" $file | awk '{print $11/'$mass'}' | head -1`
#  ratio=`grep -a "9000001    2    1    2" $file | awk '{print $11/'$mass'}' | head -1`
  ratio=`grep -a "39    2    1    2" $file | awk '{print $11/'$mass'}' | head -1`
#  echo $ratio
  y=1.001; z=0.999; 
  echo "$file $ratio $y $z" | awk '{if ($2 > $3 || $2 < $4)print $1 " has problem! ratio = "$2}'

done
