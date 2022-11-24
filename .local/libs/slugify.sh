#!/usr/bin/sh -e

. "$LIBRARY_HOME/read-stdin-or.sh"

# slugify(input)
# Returns a slugified version of a string
slugify() {
  readStdinOr "$1" \
    | sed 's/[^[:alnum:]]/-/g' \
    | tr '[:upper:]' '[:lower:]'
}

