#!/bin/sh

cd `dirname $0`
DOT_DIR=`pwd`

# check login shell
if [ `uname` = 'Darwin' ]; then
  login_shell=$(dscl localhost -read Local/Default/Users/$USER UserShell|cut -d' ' -f2|xargs basename)
elif [ `uname` = 'Linux' ]; then
  if [ -n "$USER" ]; then
    login_shell=$(awk -F: "\$1~/$USER/{gsub(/.*\//,\"\",\$7); print \$7}" /etc/passwd)
  else
    login_shell=$(awk -F: "\$1~/${HOME##*/}/{gsub(/.*\//,\"\",\$7); print \$7}" /etc/passwd)
  fi
fi

[ -z "$XDG_CONFIG_HOME" ] && export XDG_CONFIG_HOME="$HOME/.config"
[ ! -d $XDG_CONFIG_HOME ] && mkdir -p -v $XDG_CONFIG_HOME

# for bash
if [ "$login_shell" = "bash" ]; then
  ln -siv $DOT_DIR/.bash_profile $HOME/
  ln -siv $DOT_DIR/.bashrc $HOME/
fi

# for zsh
if type zsh > /dev/null 2>&1; then
  ln -siv $DOT_DIR/.zshenv $HOME/
fi

# for vim
if type vim > /dev/null 2>&1; then
  ln -siv $DOT_DIR/.vimrc $HOME/
fi

# create $HOME/.tmux.conf when tmux version < 3.2
if type tmux > /dev/null 2>&1; then
  if ! tmux -V|grep -qE '3\.[2-9]'; then
    ln -siv $DOT_DIR/.tmux.conf $HOME/
  fi
fi

ln -siv $DOT_DIR/.config/* $XDG_CONFIG_HOME/

