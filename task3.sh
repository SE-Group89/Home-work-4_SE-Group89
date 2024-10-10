#!/bin/bash

gawk -F, '$3 == 2 && $13 ~ /S/ {print $0}' titanic.csv | sed 's/female/F/g; s/male/M/g' | tee /dev/tty | gawk -F, '$7 != "" { sum += $7; count++ } END {print "Average Age ", sum/count}'


#cat titanic.csv | sed 's/female/F/g; s/male/M/g'

#gawk -F, 'NR > 1 && $7 != "" && $3 == 2 && $13 ~ /S/ { sum += $7; count++ } END { if (count > 0) print "Sum of ages, Number of people and Average Age ", sum, count ,sum/count}' titanic.csv

