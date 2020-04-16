#!/bin/bash

#       orange   lavender  purple   algae    blue   
colors=("e9a92b" "d014ff" "ff00ff" "00ffc1" "1877c9")

rand=$$$(date +%s)
echo ${colors[$rand % ${#colors[@]} ]}
