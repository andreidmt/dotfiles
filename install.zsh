#!/bin/sh

# Exit script if any statement returns a non-true return value
set -e

# Exit script if trying to use an uninitialised variable
set -u

scriptFolder=$(dirname `realpath $0`)

cp -r "$scriptFolder/.config/zsh" "$HOME/.config"

ln -s "$HOME/.config/zsh/.zshrc" "$HOME/.zshrc"
