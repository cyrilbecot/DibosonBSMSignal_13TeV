#!/bin/tcsh

foreach file($argv)
set number=`grep -a "<event>" $file  | wc -l`
#set number=`grep -a "wgt id=" $file  | wc -l`
#set text=`grep -a 'wgt id="10"' $file | head -1`
#set number=`grep -a "$text" $file | wc -l`
#set number=`grep -a 'wgt id="10"' $file  | wc -l`
#set number=`grep -a "1.255000e+02" $file  | wc -l`
#set number=`grep -a "247000    = lhaid" $file | wc -l`
#set number=`grep -a WH02 $file | wc -l`
#set number=`grep -a WGr $file | wc -l`
# set number=`grep -a "9.118760e+01" $file  | wc -l`
# set number=`grep -a "5.753088e-03" $file  | wc -l`
#  set number=`grep -a "9000002" $file | grep -a "vc+ : cmath" | wc -l`
# echo $number
 if ($number  != 50000) then
# if ($number != 14550000) then
# if ($number != 29100000) then
  echo $file "has a problem." $number "events are produced"
 endif
end
