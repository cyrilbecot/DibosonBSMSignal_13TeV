#!/bin/bash

type=$1
spin=$2
process=${type%%_narrow*}
echo $process
if [[ ! -e $process ]]; then 
    mkdir $process
fi
location="\/cvmfs\/cms.cern.ch\/phys_generator\/gridpacks\/slc6_amd64_gcc481\/13TeV\/madgraph\/V5_2.2.2\/exo_diboson\/Spin-${spin}\/${process}\/narrow\/v1\/"${type}"_tarball.tar.xz"
echo $location
filename=${type}_13TeV-madgraph_cff.py
echo $filename >> file.txt

sed -e 's/SPIN/'$spin'/g' -e 's/PROCESS/'$process'/g' -e 's/TYPE/'$type'/g' -e 's/LOCATION/'$location'/g' template_cff.py > $process/$filename
