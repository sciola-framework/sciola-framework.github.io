#!/bin/bash
[ $(xset -q | grep Caps | awk '{print $4}') = "on" ] && echo "On"
