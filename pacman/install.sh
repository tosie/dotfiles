#!/usr/bin/env bash
#
# This installs some of the common dependencies needed (or at least desired)
# using pacman.

parentDirectory="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd -P)"
dotfilesDirectory="$(cd "$( dirname "$parentDirectory" )" && pwd -P)"

if ! command -v pacman &> /dev/null
then
  exit 0
fi

# Install rmate.
if test ! "/usr/local/bin/rmate"
then
  echo "  Installing rmate and making it executable"
  cp "$dotfilesDirectory/rmate" "/usr/local/bin/rmate"
  chmod a+x /usr/local/bin/rmate
fi

echo "  Synchronizing the pacman package databases and installing common packages"
sudo pacman -Syu --noconfirm --needed pacman-contrib vim sudo mosh tmux wget bash-completion helix mcfly lnav ncdu btop lazygit glow nnn fastfetch

exit 0
