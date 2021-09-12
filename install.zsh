#!/bin/sh

# Exit script if any statement returns a non-true return value
set -e

# Exit script if trying to use an uninitialised variable
set -u

# absolute path of the folder containing this script file
dirpath=$(dirname `realpath $0`)

#
# Restore zsh configs
#

mkdir -p "$HOME/.config"
cp -r "$dirpath/.config/zsh" "$HOME/.config"

if [ -f "$HOME/.zshrc" ]; then
  mv "$HOME/.zshrc" "$HOME/.zshrc_backup"
fi

ln -s "$HOME/.config/zsh/.zshrc" "$HOME/.zshrc"

#
# Install zsh plugins
#

mkdir -p "$HOME/.local"
cp -r "$dirpath/.local/scripts" "$HOME/.local"
cp -r "$dirpath/.local/statusbar" "$HOME/.local"

cd ~/.local/scripts && ./sys.zsh.update
