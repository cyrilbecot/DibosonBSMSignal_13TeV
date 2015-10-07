The example below is for the HVT model. You should modify the commands based on your own models.
To produce gridpack cards of multiple mass points, do the following:

0)

```
git clone git@github.com:syuvivida/DibosonBSMSignal_13TeV.git 
cd DibosonBSMSignal_13TeV/gridpack_folder
```

1) prepare process card of the channel of interest, by default, we 
 generate 4-flavor production, i.e. definition of proton does not have b 
 quarks.

 If you want to generate 5-flavor mode, you need to change the PDF set in 
 cards/run_card.dat. 
 The PDF set 263400 corresponds to LO 4F PDF sets: NNPDF30_lo_as_0130_nf_4.

 In addition, you need to add the following line in the process card:

 ```
 define p = u c d s b u~ c~ d~ s~ b~
 ```

2) prepare a customization card to set the mass and width, 
like this one:
https://github.com/syuvivida/DibosonBSMSignal_13TeV/blob/master/gridpack_folder/cards/HVT_customizecards.dat

The script scripts/card_generation.sh will replace the variables "MASS" and 
"WIDTH" with numbers. Note, for the HVT models, you need to modify the 
rhoinput block as well when you change the mass.


3) put these cards in the "cards" directory

4) prepare a text file that specifies the values of mass you want to 
generate 

like this one:
https://github.com/syuvivida/DibosonBSMSignal_13TeV/blob/master/gridpack_folder/mass_files/mass_points

5) run the script under the directory of DibosonBSMSignal_13TeV/gridpack_folder 

  a) if you want to generate a narrow width 0.001 GeV for the signal

```
./scripts/card_generation.sh Zprime_Zh_Zlephbb mass_files/mass_points HVT_customizecards.dat
```

  b) if you want to generate a wider width for the signal, say 5% of the mass

```
./scripts/card_generation.sh Zprime_Zh_Zlephbb mass_files/mass_points HVT_customizecards.dat 0.05 medium
```

6) If you have prepared cards different from those in the repository of DibosonBSMSignal_13TeV, please remember to make a pull request so that your cards will be stored in this repository

to do so

 a) fork this repository by clicking on the "Fork" symbol at the upper right corner of github page.

 b) 
``` 
git clone git@github.com:<your_userID>/DibosonBSMSignal_13TeV.git

cd DibosonBSMSignal_13TeV

git add ...

git commit -m "xxx"

git push origin master
```
 c) at the github page:https://github.com/<your_userID>/DibosonBSMSignal_13TeV,

  click on "Pull Request"
 


  
 