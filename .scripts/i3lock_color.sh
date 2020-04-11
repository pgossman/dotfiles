#!/bin/bash

#       orange   lavender  purple  sky blue
colors=("e9a92b" "d014ff" "ff00ff" "00ffc1")

rand=$$$(date +%s)
echo ${colors[$rand % ${#colors[@]} ]}
