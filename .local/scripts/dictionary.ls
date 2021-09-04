#!/usr/bin/sh

# Exit script if any statement returns a non-true return value
set -e

# Exit script if trying to use an uninitialised variable
set -u

dataSourcePath="$HOME/Work/wordset.dictionary/data"

cat "$dataSourcePath/a-z.rofi" 
