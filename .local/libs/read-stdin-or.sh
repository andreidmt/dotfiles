#!/bin/sh -e

# readStdinOr(value)
# Return stdin if not empty, otherwise data passed as args.
readStdinOr() {
  if [ -t 0 ]; then 
    printf "%s" "$@"
  else 
    while IFS= read -r line; do
      printf "%s\n" "$line"
    done < /dev/stdin
  fi
}

