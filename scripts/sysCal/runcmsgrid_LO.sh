#!/bin/bash

cd /afs/cern.ch/work/s/syu/public/CMSSW_7_4_0_pre5/src
export SCRAM_ARCH=slc6_amd64_gcc481; eval `scramv1 runtime -sh`
cd -

#make sure lhapdf points to local cmssw installation area
LHAPDFCONFIG=`echo "$LHAPDF_DATA_PATH/../../bin/lhapdf-config"`

#if lhapdf6 external is available then above points to lhapdf5 and needs to be overridden
LHAPDF6TOOLFILE=$CMSSW_BASE/config/toolbox/$SCRAM_ARCH/tools/available/lhapdf6.xml
if [ -e $LHAPDF6TOOLFILE ]; then
  LHAPDFCONFIG=`cat $LHAPDF6TOOLFILE | grep "<environment name=\"LHAPDF6_BASE\"" | cut -d \" -f 4`/bin/lhapdf-config
fi

#make sure env variable for pdfsets points to the right place
export LHAPDF_DATA_PATH=`$LHAPDFCONFIG --datadir`



infile=$1
echo $infile
outfile=/data4/syu/step2_13TeV_Diboson`echo "${infile##*Diboson}"`
echo "Producing weights and saved in "$outfile
./mgbasedir/SysCalc/sys_calc $1 syscalc_card.dat $outfile
