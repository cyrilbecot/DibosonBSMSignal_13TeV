#!/bin/bash

ls $1 >& filenames.txt

SUFF=lhe
suff=root

while read filename
do
    echo "Printing: $filename"
for i in $(ls $1/$filename/*.$SUFF)
do
  temp=${i%.$SUFF}.$suff
  outputfile=/data4/syu/13TeV_Diboson`echo "${temp##*Diboson}"`
#  echo $i 
#  echo $outputfile
  cmsRun dumpLHE_cfg.py inputFiles="file:"$i outputFile=$outputfile
done 

done < filenames.txt
