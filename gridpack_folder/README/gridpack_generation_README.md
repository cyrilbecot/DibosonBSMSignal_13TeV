
Once your Madgraph cards are approved by the generator conveners, you could go ahead and produce 
gridpacks.

1) 
```
git clone git@github.com:syuvivida/DibosonBSMSignal_13TeV.git

git clone git@github.com:cms-sw/genproductions.git genproductions
```
2)

```
cd genproductions/bin/MadGraph5_aMCatNLO

cp -p ../../../DibosonBSMSignal_13TeV/gridpack_folder/scripts/loop_gridpackProd.sh .

cp -p ../../../DibosonBSMSignal_13TeV/gridpack_folder/scripts/runJob.sh .

cp -p ../../../DibosonBSMSignal_13TeV/gridpack_folder/mass_files/* .
```

3)

```
./loop_gridpackProd.sh $PWD RSGraviton_hh_hbbhbb [mass input file] cards/production/13TeV/exo_diboson/Spin-2
```

Note, you need to change the process name and the directory of corresponding spin that suit your process. 


Option of [mass input file]:

 a) If you are generating X->hh->tatabb or X->hh->aabb, use "tatabb_mass_points". 
    There are 28 mass points.

 b) If you are generating other di-higgs final state, use "hh_mass_points".
    There are 24 mass points.

 c) If you are generating all other Exo channels, use "mass_points".
    There are 13 mass points.

 d) You could also create your own mass input files.


4) !!! Note, when the gridpacks are done, do a check to make sure 
 the gridpacks are OK.

```
 grep -a STOP *log

 cd CMSSW_7_1_17/src
 cmsenv

 mkdir temp
 cd temp
 tar xf [one gridpack name]
 ./runcmsgrid.sh 10 12312 1
```

 and see if the output LHE file makes sense (process, mass points).

 You could also use this LHEanalyzer to check the kinematic distributions.

 https://github.com/syuvivida/DibosonBSMSignal_13TeV/tree/master/analyzer 
  