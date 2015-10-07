The example below is for the HVT model. You should modify the commands based on your own models.
To produce gridpack cards of multiple mass points, do the following:

0)

```
git clone git@github.com:syuvivida/DibosonBSMSignal_13TeV.git 
cd DibosonBSMSignal_13TeV/gridpack_folder
```

1) prepare process card of the channel of interest, make sure it's 
 a 4-flavor production, i.e. "define p = u c d s u~ c~ d~ s~": definition 
 of proton does not have b quarks.

 If you want to generate 5-flavor mode, you need to change the PDF set in 
 cards/run_card.dat 
 The PDF set 263400 corresponds to LO 4F PDF sets: NNPDF30_lo_as_0130_nf_4.

2) prepare a customization card to set the mass and width, 
like this one:
https://github.com/syuvivida/DibosonBSMSignal_13TeV/blob/master/gridpack_folder/cards/BulkG_customizecards.dat

Leave the line "set param_card mass 39 MASS" unchanged. The script card_generation.sh will replace this variable 
"MASS" with numbers. Note, for the HVT models, you need to modify the rhoinput block as well when you change the mass.

Also leave the line "set param_card decay 39 DECAY" unchanged.

3) put these cards in the "cards" directory

4) prepare a text file that specifies the values of mass you want to 
generate 

like this one:
https://github.com/syuvivida/DibosonBSMSignal_13TeV/blob/master/gridpack_folder/mass_files/mass_points

5) run the script under the directory of DibosonBSMSignal_13TeV/gridpack_folder 
```
cd DibosonBSMSignal_13TeV/gridpack_folder
```

a) if you want to generate a narrow width 0.001 GeV for the signal

```
./scripts/card_generation.sh Zprime_Zh_Zlephbb mass_files/mass_points HVT_customizecards.dat
```

b) if you want to generate a wider width for the signal, say 5% of the mass

```
./scripts/card_generation.sh Zprime_Zh_Zlephbb mass_files/mass_points HVT_customizecards.dat 0.05 medium
```
