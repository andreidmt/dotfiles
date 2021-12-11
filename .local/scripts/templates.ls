#!/bin/sh

snippetsPath="$HOME/.local/snippets"

cd "$snippetsPath" || exit 1

rg --files | sort -r
