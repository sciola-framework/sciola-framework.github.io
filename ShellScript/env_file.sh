#!/bin/bash

# Exports environment variables defined in the ".env" file

ENV_FILE=/path/to/file.env
set -o allexport
[[ -f $ENV_FILE ]] && source $ENV_FILE
set +o allexport
