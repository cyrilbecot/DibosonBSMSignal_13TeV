#!/bin/bash

type=$1
process=${type%%_narrow*}
echo $process
location="\/cvmfs\/cms.cern.ch\/phys_generator\/gridpacks\/slc6_amd64_gcc481\/13TeV\/madgraph\/V5_2.2.2\/exo_diboson\/Spin-1\/${process}\/narrow\/v2\/"${type}"_tarball.tar.xz"
echo $location
filename=${type}_cff.py
echo $filename

sed -e 's/PROCESS/'$process'/g' -e 's/TYPE/'$type'/g' -e 's/LOCATION/'$location'/g' template_cff.py > $filename
