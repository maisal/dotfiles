#!/bin/sh

set -e

OS=$(uname)
SUDO=

case "$OS" in
  'Darwin' )
    if ! type git > /dev/null 2>&1; then
      xcode-select --install
      echo "Complete the Command Line Tools installation, then run this script again."
      exit 1
    fi
    ;;
  'Linux' )
    if ! type git > /dev/null 2>&1; then
      if [ "`whoami`" != "root" ]; then
        SUDO="sudo"
      fi
      # Debian/Ubuntu
      if type apt-get > /dev/null 2>&1; then
        $SUDO apt-get update -y
        $SUDO apt-get install -y git
      # Fedora
      elif type dnf > /dev/null 2>&1; then
        $SUDO dnf update -y
        $SUDO dnf install -y git
      # Arch Linux
      elif type pacman > /dev/null 2>&1; then
        $SUDO pacman -Syu --noconfirm git
      # openSUSE
      elif type zypper > /dev/null 2>&1; then
        $SUDO zypper --non-interactive refresh
        $SUDO zypper --non-interactive install git
      else
        echo "No supported package manager found. Install Git, then run this script again." >&2
        exit 1
      fi
    fi
    ;;
  * )
    echo "This OS is not supported."
    exit 1
esac

git clone https://github.com/maisal/dotfiles.git "$HOME/dotfiles"
