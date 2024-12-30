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

# Install rmate.
if test ! "/usr/local/bin/rmate"
then
  echo "  Installing rmate and making it executable"
  cp "$dotfilesDirectory/rmate" "/usr/local/bin/rmate"
  chmod a+x /usr/local/bin/rmate
fi

aptOptions="--no-install-recommends --assume-yes --show-upgraded"

echo "  Synchronizing the apt package databases and installing common packages"
# shellcheck disable=SC2086
sudo apt-get $aptOptions update \
  && sudo apt-get $aptOptions install vim sudo mosh tmux wget bash-completion lnav ncdu btop nnn fastfetch \
  && sudo apt-get $aptOptions upgrade \
  && sudo apt-get $aptOptions autoremove

exit 0
