#!/bin/tcsh

foreach file($argv)
 set number=`grep -a "<event>" $file  | wc -l`
 if ($number != 50000) then
  echo $file "has a problem"
 endif
end
