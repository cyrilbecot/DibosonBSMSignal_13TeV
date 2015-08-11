#!/bin/bash

SUFF=lhe
suff=root

for i in $(ls $1)
do
  temp=${i%.$SUFF}.$suff
  outputfile=/data4/syu/13TeV_Diboson/`echo "${1##*Diboson}"`/$temp
  echo $1/$i 
  echo $outputfile
  cmsRun dumpLHE_cfg.py inputFiles=file:$1/$i outputFile=$outputfile
done 
