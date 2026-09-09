#!/bin/sh

set -e

cd -P -- "$(dirname -- "$0")"
DOT_DIR=$(pwd)

# check login shell
login_user=${USER:-$(id -un)}
if [ "$(uname)" = 'Darwin' ]; then
  user_record=$(dscl localhost -read "Local/Default/Users/$login_user" UserShell)
  login_shell=${user_record##*/}
elif [ "$(uname)" = 'Linux' ]; then
  login_shell=$(awk -F: -v user="$login_user" '$1 == user { sub(/.*\//, "", $7); print $7; exit }' /etc/passwd)
fi

[ -z "$XDG_CONFIG_HOME" ] && export XDG_CONFIG_HOME="$HOME/.config"
mkdir -p -v "$XDG_CONFIG_HOME"

# for bash
if [ "$login_shell" = "bash" ]; then
  ln -siv "$DOT_DIR/.bash_profile" "$HOME/"
  ln -siv "$DOT_DIR/.bashrc" "$HOME/"
fi

# for zsh
if type zsh > /dev/null 2>&1; then
  ln -siv "$DOT_DIR/.zshenv" "$HOME/"
fi

# for vim
if type vim > /dev/null 2>&1; then
  ln -siv "$DOT_DIR/.vimrc" "$HOME/"
fi

ln -siv "$DOT_DIR"/.config/* "$XDG_CONFIG_HOME/"
