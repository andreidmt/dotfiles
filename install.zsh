#!/bin/sh

# Exit script if any statement returns a non-true return value
set -e

# Exit script if trying to use an uninitialised variable
set -u

# absolute path of the folder containing this script file
dirpath=$(dirname `realpath $0`)

mkdir - "$HOME/.config"
cp -r "$dirpath/.config/zsh" "$HOME/.config"

mv "$HOME/.zshrc" "$HOME/.zshrc_backup"
ln -s "$HOME/.config/zsh/.zshrc" "$HOME/.zshrc"
