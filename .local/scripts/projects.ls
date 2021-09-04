#!/usr/bin/sh

# Exit script if any statement returns a non-true return value
set -e

# Exit script if trying to use an uninitialised variable
set -u

home="$HOME/Work"

cd "$home" && ls -l | grep '^d' | awk '{ print $9 }'
