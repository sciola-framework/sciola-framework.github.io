#!/bin/bash

# Real path of the symbolic link
# Usage:
# debian@debian:~$ realpath.sh your_symbolic_link

echo $(dirname $(readlink $(which $1)))
