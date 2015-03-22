To produce gridpack cards of multiple mass points, do the following:

1) prepare process card of the channel of interest, make sure it's 
 a 4-flavor production, i.e. "define p = u c d s u~ c~ d~ s~": definition 
 of proton does not have b quarks.

 If you want to generate 5-flavor mode, you need to change the PDF set in 
 cards/run_card.dat 
 The PDF set 263400 corresponds to LO 4F PDF sets: NNPDF30_lo_as_0130_nf_4.

2) prepare a customization card to set the mass and width, 
like this one:
https://github.com/syuvivida/DibosonBSMSignal_13TeV/blob/master/gridpack_folder/cards/BulkG_narrowWidth_customizecards.dat

Leave the line "set param_card mass 39 MASS" unchanged. The script card_generation.sh will replace this variable "MASS" with numbers. Note, for the HVT models, you need to modify the rhoinput block as well when you change the mass.

3) put these cards in the "cards" directory

4) prepare a text file that specifies the values of mass you want to 
generate 

like this one:
https://github.com/syuvivida/DibosonBSMSignal_13TeV/blob/master/gridpack_folder/mass_points

5) run the script

./card_generation.sh Zprime_Zh_Zlephbb mass_points HVT_narrowWidth_customizecards.dat
