#!/bin/bash

scriptname=`basename $0`
EXPECTED_ARGS=4

if [ $# -ne $EXPECTED_ARGS ]
then
    echo "Usage: $scriptname processName massinputFile Spin EOSDirVersion"
    echo "Example: ./$scriptname Radion_hh_hbbhbb $PWD/mass_points 0 v2"
    exit 1
fi

iteration=0
lastfile=`cat $2 | wc -l`
echo "There are "$lastfile" mass points"
process=$1
spin=$3
version=$4
#dir=/store/group/phys_generator/cvmfs/gridpacks/slc6_amd64_gcc481/13TeV/madgraph/V5_2.2.2//exo_diboson/Spin-${spin}/${process}/narrow/$version
dir=/cvmfs/cms.cern.ch/phys_generator/gridpacks/slc6_amd64_gcc481/13TeV/madgraph/V5_2.2.2//exo_diboson/Spin-${spin}/${process}/narrow/$version 
while [ $iteration -lt $lastfile ]; 
do
  iteration=$(( iteration + 1 ))
  mass=(`head -n $iteration $2  | tail -1`)
  file=${process}_narrow_M${mass}_tarball.tar.xz
  cmsLs $dir/$file
#  echo $dir/$file
done
