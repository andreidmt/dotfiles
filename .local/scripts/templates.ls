#!/bin/sh

##
## List all Template names
##

home="$HOME/.local/snippets"

cd "$home" && rg --files | sort -r
