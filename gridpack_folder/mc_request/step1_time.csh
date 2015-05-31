#!/bin/tcsh

foreach file($argv)
    grep -a  "AvgEventCPU" $file/step1*xml | awk '{print $3}'   | sed 's/Value="//g' | sed 's/"\/>//g' | head -c 7
end
