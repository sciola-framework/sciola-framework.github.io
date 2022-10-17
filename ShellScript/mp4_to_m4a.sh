#!/bin/bash

for file in *.mp4; do
    file=${file%.mp4}
    ffmpeg -i $file.mp4 -vn -c:a copy $file.m4a
done
