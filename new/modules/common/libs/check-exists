#!/usr/bin/sh

# checkExistsInPath(command)
# Checks if a command exists in $PATH
checkExistsInPath() {
  if command -v "$1" > /dev/null; then
    return 0
  else
    return 1
  fi
}
