#!/usr/bin/bash -e

scriptName=$(basename "$0")

# die(message, exitCode = 1)
# Print a message and exit with the given code.
die() {
  doomst --type error "$scriptName" "$1"
  echo -e "ERROR: $scriptName \n $1" 1>&2
  exit "${2:-1}"
}

