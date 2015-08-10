#!/bin/bash

scriptname=`basename $0`
EXPECTED_ARGS=3

if [ $# -ne $EXPECTED_ARGS ]
then
    echo "Usage: $scriptname foldername Spin EOSDirVersion"
    echo "Example: ./$scriptname RSGraviton_ZZ_ZlepZhad_narrow_M600 2 v1"
    exit 1
fi


type=$1
spin=$2
version=$3
process=${type%%_narrow*}
echo $process
if [[ ! -e $process ]]; then 
    mkdir $process
fi
location="\/cvmfs\/cms.cern.ch\/phys_generator\/gridpacks\/slc6_amd64_gcc481\/13TeV\/madgraph\/V5_2.2.2\/exo_diboson\/Spin-${spin}\/${process}\/narrow\/${version}\/${type}_tarball.tar.xz"
echo $location
filename=${type}_13TeV-madgraph_cff.py
echo $filename >> file.txt

sed -e 's/SPIN/'$spin'/g' -e 's/PROCESS/'$process'/g' -e 's/TYPE/'$type'/g' -e 's/LOCATION/'$location'/g' template_cff.py > $process/$filename
