
The order of producing gridpacks is as follows:

1) Prepare input cards for madgraph

 run_card.dat, proc_card.dat, customizecards.dat, and extramodels.dat

 Read https://github.com/syuvivida/DibosonBSMSignal_13TeV/blob/master/gridpack_folder/README/card_generation_README.md

2) Make a pull request in genproduction package

 You need to state the number of events requested in the pull request.

https://github.com/cms-sw/genproductions/tree/master/bin/MadGraph5_aMCatNLO/cards/production/13TeV/exo_diboson
 
 Follow the instruction here to make pull request: 
 https://twiki.cern.ch/twiki/bin/viewauth/CMS/GitRepositoryForGenProduction

3) Once the pull request is approved, you could start producing gridpacks.

  Read https://github.com/syuvivida/DibosonBSMSignal_13TeV/blob/master/gridpack_folder/README/gridpack_generation_README.md

4) After you finish producing gridpacks, you could make MC requests 
 
  Read https://github.com/syuvivida/DibosonBSMSignal_13TeV/blob/master/gridpack_folder/README/mc_request_README.md
 

 