How to use the LHE analyzer
======================

  cmsrel CMSSW_7_1_14

  cd CMSSW_7_1_14/src/

  cmsenv

  git cms-addpkg GeneratorInterface/LHEInterface

// you will be asked to Enter passphrase for key several times

  git clone git@github.com:syuvivida/DibosonBSMSignal_13TeV.git DibosonBSMSignal_13TeV

  mv DibosonBSMSignal_13TeV/analyzer/DummyLHEAnalyzer.cc GeneratorInterface/LHEInterface/test/.

  mv DibosonBSMSignal_13TeV/analyzer/dumpLHE_cfg.py .  

  rm -rf DibosonBSMSignal_13TeV

  cmsenv

  scramv1 b

 3. To run,

  cmsRun dumpLHE_cfg.py inputFiles="file:xxx.lhe" outputFile="test.root" maxEvents=1000
