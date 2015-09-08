DibosonBSMSignal_13TeV
======================

1)
git clone git@github.com:cms-sw/genproductions.git genproductions
 
cd genproductions
 
git checkout mg230


cd bin/MadGraph5_aMCatNLO

bash

source gridpack_generation.sh interactive

(a folder "interactive" will be created)

2) 

 If you want to change the run cards, say use a different PDF
 or use different number of events, modify the card
 in
  interactive/interactive_gridpack/work/MG5_aMC_v2_3_0/Template/LO/Cards/run_card.dat 

3) 
 go back to the directory bin/MadGraph5_aMCatNLO

4) 
wget https://raw.githubusercontent.com/syuvivida/DibosonBSMSignal_13TeV/master/gridpack_folder/mass_files/mass_points

wget https://raw.githubusercontent.com/syuvivida/DibosonBSMSignal_13TeV/master/launchScripts/launch.sh

wget https://raw.githubusercontent.com/syuvivida/DibosonBSMSignal_13TeV/master/launchScripts/runLaunch.sh

wget https://raw.githubusercontent.com/syuvivida/DibosonBSMSignal_13TeV/master/launchScripts/Radion_hh_hbbhbb_proc_card.dat

the launch.sh will automatically loop over 13 mass points in
 the mass_point file and generate LHE file for a certain width
 
 launch.sh will submit job to the batch system
 for example, to generate width of 5% of mass mean,
 
 ./launch.sh Radion_hh_hbbhbb mass_points 0.05 medium
 
 

