#!/usr/bin/env bash

# Set up the fastfetch configuration by symlinking to the dotfiles directory.

parentDirectory="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd -P)"
dotfilesDirectory="$(cd "$( dirname "$parentDirectory" )" && pwd -P)"
configDirectory="${XDG_CONFIG_HOME:-$HOME/.config}/fastfetch"

# Symlink the fastfetch configuration directory to the dotfiles directory.
if [ ! -d "$configDirectory" ]; then
  if ln -s "$dotfilesDirectory/fastfetch" "$configDirectory"; then
    echo "  Symlinked the fastfetch configuration directory to the dotfiles directory"
  fi
fi

exit 0
