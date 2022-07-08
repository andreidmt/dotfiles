#!/bin/sh

# readStdinOr(value)
# Return stdin if not empty, otherwise the given value.
readStdinOr() {
  if [ -t 0 ]; then 
    echo "$1"
  else 
    read -r value
    echo "$value"
  fi
}

