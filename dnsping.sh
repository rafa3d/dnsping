#!/bin/bash

echo $'   _             _         '
echo $' _| |___ ___ ___|_|___ ___ '
echo $'| . |   |_ -| . | |   | . |'
echo $'|___|_|_|___|  _|_|_|_|_  |'
echo $'            |_|       |___|'
echo github.com/rafa3d '    ' V1.0
echo

SECONDS=0
repeat=1

servers=( '1.1.1.1' '1.0.0.1' '8.8.8.8' '8.8.4.4' '9.9.9.9' '149.112.112.112' '208.67.222.222' '208.67.220.220' '8.26.56.26' '8.20.247.20' '185.228.168.9' '185.228.169.9' '64.6.64.6' '64.6.65.6' '209.244.0.3' '209.244.0.4' '84.200.69.80' '84.200.70.40' '195.46.39.39' '195.46.39.40' '77.88.8.8' '77.88.8.1' '91.239.100.100' '89.233.43.71' '74.82.42.42' '212.166.64.1' '5.2.67.250' )

time_start=$(date +%s%3)

BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

for i in "${servers[@]}"

do
    
    size=${#i}
    
    tab='\t\t'
    
    if [[ $size -gt 14 ]]
    then
        tab='\t'
    fi
    
    speed=$(ping -c $repeat "$i" | tail -1| awk '{print $4}' | cut -d '/' -f 2)
    int=${speed%.*}
    color="${NC}"
    
    if [[ $((int)) -lt 20 ]]
    then
        color="${BLUE}"
    fi
    
    if [[ $((int)) -gt 30 ]]
    then
        color="${RED}"
    fi
    
    echo -en $color
    echo -en $i $tab
    echo $speed
    echo -en "${NC}"
    
done

echo

time_end=$(date +%s%3)

let result=time_end-time_start
let result=result/10+1
echo -n Took $result
echo -n s on' '
date +%H:%M:%S' '%d-%m-%Y
echo