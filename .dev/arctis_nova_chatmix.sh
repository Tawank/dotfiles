#!/bin/bash

last_level=-1

hidapitester -q --vidpid 1038:2202 --usagePage 0xFF00 -l 3 -t 30000 --open --read-input-forever | while read -r -a data
do 
    if [ "${data[0]}" = 45 ]; then
        # Calculate 0–100 value
        vol=$(( (0x${data[1]} + 0x64 - 0x${data[2]}) * 100 / 200 ))

        # Map to one of 0, 26, 76, 100
        if   [ "$vol" -lt 25 ]; then
            level=0
        elif [ "$vol" -lt 50 ]; then
            level=26
        elif [ "$vol" -lt 75 ]; then
            level=51
        else
            level=76
        fi

        # Only send command if level changed
        if [ "$level" -ne "$last_level" ]; then
            headsetcontrol -s "$level"
            last_level=$level
        fi
    fi
done
