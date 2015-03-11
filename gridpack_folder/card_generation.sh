#!/bin/bash

scriptname=`basename $0`
EXPECTED_ARGS=3
if [ $# -ne $EXPECTED_ARGS ]
then
echo "Usage: $scriptname processName massInputFile customizationInputFile"
echo "Example: ./$scriptname Zprime_Zh_Zlephbb mass_points HVT_narrowWidth_customizecards.dat"
exit 1
fi

# name of the run
name=$1

# mass input files
massInput=$2

## customercards
custom=$3


export PRODHOME=`pwd`
CARDSDIR=${PRODHOME}/cards

########################
#Locating the proc card#
########################
if [ ! -e $CARDSDIR/${name}_proc_card.dat ]; then
    echo $CARDSDIR/${name}_proc_card.dat " does not exist!"
    exit 1;
fi


########################
#Locating the customization 
########################
if [ ! -e $CARDSDIR/$custom ]; then
    echo $CARDSDIR/$custom " does not exist!"
    exit 1;
fi


run=run_card.dat
########################
#Locating the run card
########################
if [ ! -e $CARDSDIR/$run ]; then
    echo $CARDSDIR/$run " does not exist!"
    exit 1;
fi

########################
#Run the code-generation step to create the process directory
########################
topdir=$CARDSDIR/$name
mkdir $topdir
iteration=0
lastfile=`cat $massInput | wc -l`
echo "There are "$lastfile" mass points"

while [ $iteration -lt $lastfile ]; 
do
  iteration=$(( iteration + 1 ))
  mass=(`head -n $iteration $massInput  | tail -1`)
  echo "Producing cards for X mass = "$mass" GeV"
  newname=${name}_narrow_M${mass}
  mkdir $topdir/$newname
  dir=$CARDSDIR/$name/$newname
  sed -e 's/.*output.*/output '${newname}' -nojpeg\n/' $CARDSDIR/${name}_proc_card.dat > $dir/${newname}_proc_card.dat
  sed 's/MASS/'$mass'/g' $CARDSDIR/$custom > $dir/${newname}_customizecards.dat
  cp $CARDSDIR/run_card.dat $dir/${newname}_run_card.dat
done



