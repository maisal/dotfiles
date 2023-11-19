#!/bin/sh

OS=$(uname)

case "$OS" in
  'Darwin' )
    if ! type git > /dev/null 2>&1; then
      xcode-select --install
    fi
    ;;
  'Linux' )
    if ! type git > /dev/null 2>&1; then
      if [ "`whoami`" != "root" ]; then
        SUDO="sudo"
      fi
      # Debian/Ubuntu
      if type apt-get > /dev/null 2>&1; then
        $SUDO apt-get update
        $SUDO apt-get install git
      # Fedora
      elif type dnf > /dev/null 2>&1; then
        $SUDO dnf update
        $SUDO dnf install git
      # Arch Linux
      elif type pacman > /dev/null 2>&1; then
        $SUDO pacman -Syu git
      # openSUSE
      elif type zypper > /dev/null 2>&1; then
        $SUDO zypper refresh
        $SUDO zypper install git
      fi
    fi
    ;;
  * )
    echo "This OS is not supported."
    return 1
esac

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
git clone https://github.com/maisal/dotfiles.git $HOME/dotfiles
