#!/usr/bin/env bash
#
# This installs some of the common dependencies needed (or at least desired)
# using apt.

parentDirectory="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd -P)"
dotfilesDirectory="$(cd "$( dirname "$parentDirectory" )" && pwd -P)"

if ! command -v apt &> /dev/null
then
  exit 0
fi

aptOptions="--no-install-recommends --assume-yes --show-upgraded --show-progress"

echo "  Synchronizing the apt package databases and installing common packages"
sudo apt-get $aptOptions update \
  && apt-get $aptOptions install vim sudo mosh tmux wget bash-completion helix mcfly lnav ncdu btop lazygit glow nnn \
  && apt-get $aptOptions upgrade \
  && apt-get $aptOptions autoremove

# Install rmate.
if test ! "/usr/local/bin/rmate"
then
  echo "  Installing rmate and making it executable"
  cp "$dotfilesDirectory/rmate" "/usr/local/bin/rmate"
  chmod a+x /usr/local/bin/rmate
fi

exit 0
