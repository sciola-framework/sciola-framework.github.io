#!/bin/bash
while : ; do
    IFS=
    read -n 1 key
    ## Press the 'enter' key
    [ "$key" = "" ] && eject -T
    ## Press the 'q' key to exit
    [ "$key" = "q" ] && break
    sleep 0.5
done
