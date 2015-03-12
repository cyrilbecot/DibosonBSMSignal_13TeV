To produce gridpack cards of multiple mass points, do the following:

1) prepare process card of the channel of interest, make sure it's 
 a 4 F production, i.e. "define p = u c d s u~ c~ d~ s~": definition 
 of proton does not have b quarks.

 If you want to generate 5F mode, you need to change the PDF set in 
 cards/run_card.dat

2) prepare a customization card to set the mass and width, 
like this one:
https://github.com/syuvivida/DibosonBSMSignal_13TeV/blob/master/gridpack_folder/cards/BulkG_narrowWidth_customizecards.dat

Leave the line "set param_card mass 39 MASS" unchanged. The following 
script will replace this variable "MASS" with numbers.

3) put these cards in the cards directory

4) prepare a text file that specifies the values of masses you want to 
generate 

like this one:
https://github.com/syuvivida/DibosonBSMSignal_13TeV/blob/master/gridpack_folder/mass_points

5) run the script

./card_generation.sh Zprime_Zh_Zlephbb mass_points HVT_narrowWidth_customizecards.dat
