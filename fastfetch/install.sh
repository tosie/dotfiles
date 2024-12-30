#!/usr/bin/env bash

# Set up the fastfetch configuration by symlinking to the dotfiles directory.

parentDirectory="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd -P)"
dotfilesDirectory="$(cd "$( dirname "$parentDirectory" )" && pwd -P)"
configDirectory="${XDG_CONFIG_HOME}/fastfetch"

# Symlink the fastfetch configuration directory to the dotfiles directory.
if [ ! -d "$configDirectory" ]; then
  ln -s "$dotfilesDirectory/fastfetch" "$configDirectory"
  echo "  Symlinked the fastfetch configuration directory to the dotfiles directory"
fi

exit 0
