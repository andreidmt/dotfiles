#!/bin/sh

# Exit script if any statement returns a non-true return value
set -e

# Exit script if trying to use an uninitialised variable
set -u

# absolute path of the folder containing this script file
dirpath=$(dirname `realpath $0`)

# History folder
mkdir -p "$HOME/.cache/zsh"

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

#
# Install Node.js
#

nodeLTSVersion=$(nvm ls-remote \
  | grep "Latest LTS" \
  | tail -n 1 \
  | awk '{print $2}' \
  | tr '.' '\n' \
  | head -n 1
)

nvm install "$nodeLTSVersion" --reinstall-packages-from=current --latest-npm
nvm alias default "$nodeLTSVersion"
