#!/bin/bash

ls -lrt $1 | grep -a syu  | awk -v my_var=$1 '{print "bsub -q2nd $PWD/loop_gridpackProd.sh $PWD "$8" $PWD/mass_points "my_var}'

