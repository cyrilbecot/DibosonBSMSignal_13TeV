#!/bin/bash
#set -o verbose

echo "Starting job on " `date` #Only to display the starting of production date
echo "Running on " `uname -a` #Only to display the machine where the job is running
echo "System release " `cat /etc/redhat-release` #And the system release

#First you need to set couple of settings:

# name of the run
name=${2}

# which mass
mass=$3

#________________________________________
# to be set for user spesific
# Release to be used to define the environment and the compiler needed

#For correct running you should place at least the run and proc card in a folder under the name "cards" in the same folder where you are going to run the script
cd /afs/cern.ch/work/s/syu/public/CMSSW_7_2_3/src
export SCRAM_ARCH=slc6_amd64_gcc481; eval `scramv1 runtime -sh`
cd $1
export PRODHOME=`pwd`
CARDSDIR=${PRODHOME}/cards


MGBASEDIRORIG=MG5_aMC_v2_2_2

cd ${PRODHOME}/$MGBASEDIRORIG

LHAPDFCONFIG=`echo "$LHAPDF_DATA_PATH/../../bin/lhapdf-config"`

  #if lhapdf6 external is available then above points to lhapdf5 and needs to be overridden
LHAPDF6TOOLFILE=$CMSSW_BASE/config/toolbox/$SCRAM_ARCH/tools/available/lhapdf6.xml
if [ -e $LHAPDF6TOOLFILE ]; then
    LHAPDFCONFIG=`cat $LHAPDF6TOOLFILE | grep "<environment name=\"LHAPDF6_BASE\"" | cut -d \" -f 4`/bin/lhapdf-config
fi

#make sure env variable for pdfsets points to the right place
export LHAPDF_DATA_PATH=`$LHAPDFCONFIG --datadir`

LHAPDFINCLUDES=`$LHAPDFCONFIG --incdir`
LHAPDFLIBS=`$LHAPDFCONFIG --libdir`


  ########################
  #Locating the proc card#
  ########################
if [ ! -e $CARDSDIR/${name}_proc_card.dat ]; then
    echo $CARDSDIR/${name}_proc_card.dat " does not exist!"
    exit 1;
fi

  ########################
  #Run the code-generation step to create the process directory
  ########################
newname=${name}_M${mass}
sed 's/'${name}'/'${newname}'/g' $CARDSDIR/${name}_proc_card.dat > ${newname}_proc_card.dat


./bin/mg5_aMC ${newname}_proc_card.dat
  
cd ${newname}
sed 's/MASSVZ/'$mass'/g' $CARDSDIR/BulkGraviton_param_card.dat > Cards/param_card.dat

#######################
#Locating the run card#
#######################
if [ ! -e $CARDSDIR/run_card.dat ]; then
  echo $CARDSDIR/run_card.dat " does not exist!"
  exit 1;
else
    if [ $mass -lt 450 ]
    then
	sed -e 's/.*nevents*/    300000    = nevents ! Number of unweighted events requested/' $CARDSDIR/run_card.dat > Cards/run_card.dat
    else
	sed -e 's/.*nevents*/    100000    = nevents ! Number of unweighted events requested/' $CARDSDIR/run_card.dat > Cards/run_card.dat
    fi
fi      


./bin/generate_events -f pilotrun

gunzip Events/pilotrun/unweighted_events.lhe.gz 

mv Events/pilotrun/unweighted_events.lhe ${PRODHOME}/${newname}_narrow.lhe