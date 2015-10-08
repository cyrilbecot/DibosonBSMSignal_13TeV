How to use the LHE analyzer
======================

Check out the package

```
  cmsrel CMSSW_7_1_19

  cd CMSSW_7_1_19/src/

  cmsenv

  git cms-addpkg GeneratorInterface/LHEInterface

  git cms-merge-topic syuvivida:7119_diboson_lhereader
```
 
Now you need to modify GeneratorInterface/LHEInterface/test/DummyLHEAnalyzer.cc so to compute the acceptance

```
  emacs -nw GeneratorInterface/LHEInterface/test/DummyLHEAnalyzer.cc 
```

Once you modify, you need to compile the code

```
  scramv1 b
```

To run,

```
 curl https://raw.githubusercontent.com/syuvivida/xtozh_common/13TeV_CMSSW747/macro_examples/dihiggs/runGreg.sh -o runGreg.sh

 chmod 755 runGreg.sh

 ./runGreg.sh >& Log &
```

 It will automatically run on LHE files of different models and masses and give you results


 
