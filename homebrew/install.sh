#!/usr/bin/env bash
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

parentDirectory="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd -P)"
dotfilesDirectory="$(cd "$( dirname "$parentDirectory" )" && pwd -P)"

# Check for Homebrew
if ! command -v brew &> /dev/null
then
  echo "  Installing Homebrew for you."

  # Install the correct homebrew for each OS type
  if test "$(uname)" = "Darwin"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  #
  # On Linux systems we do not install homebrew. Instead, use the appropriate package manager.
  # elif test "$(expr substr $(uname -s) 1 5)" = "Linux"
  # then
  #   ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
  #
  fi
fi

if command -v brew &> /dev/null
then
  echo "  Using Brewfile to install applications."
  brew bundle --file "$dotfilesDirectory/homebrew/Brewfile"

  echo "  Upgrading all Homebrew packages."
  brew upgrade
fi

exit 0
