#!/usr/bin/sh

scriptName='\~/.local/scripts/project.ls'
workPath="$HOME/Work"

cd "$workPath" && ls -l | grep '^d' | awk '{ print $9 }'
