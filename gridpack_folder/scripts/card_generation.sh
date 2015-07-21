#!/bin/bash

scriptname=`basename $0`
EXPECTED_ARGS=5
MIN_ARGS=3
factor=-1
widthName="narrow"
if [ $# -eq $MIN_ARGS ]
then
    echo "Use default width for the signal 0.001 GeV or natural width"
else if [ $# -ne $EXPECTED_ARGS ]
then
    echo "Usage: $scriptname processName massInputFile customizationInputFile factor cardString"
    echo "Example: ./scripts/$scriptname Zprime_Zh_Zlephbb mass_files/mass_points HVT_customizecards.dat 0.05 medium"
    exit 1
else
    factor=$4
    widthName=$5
fi
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
  comp=`bc <<< $factor"<=0"`
  if [ $comp -eq 1 ]
  then
      width=0.001
  else
      width=`echo "$factor*$mass" | bc -ql | head -c 9`
  fi
  echo ""
  echo "Producing cards for X mass = "$mass" GeV"
  echo "Producing signal width = "$width" GeV "
  echo "NOTE: If default HVT model is used, natural width is generated."
  echo ""
  newname=${name}_${widthName}_M${mass}
  mkdir $topdir/$newname
  dir=$CARDSDIR/$name/$newname
  sed -e 's/'$name'/'${newname}' -nojpeg\n/g' $CARDSDIR/${name}_proc_card.dat > $dir/${newname}_proc_card.dat
  sed -e 's/MASS/'$mass'/g' -e 's/WIDTH/'$width'/g' $CARDSDIR/$custom > $dir/${newname}_customizecards.dat
  cp $CARDSDIR/run_card.dat $dir/${newname}_run_card.dat
done



