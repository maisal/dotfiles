#!/bin/sh

cd `dirname $0`
DOT_DIR=`pwd`

if [ -z "$XDG_CONFIG_HOME" ]; then
  export XDG_CONFIG_HOME="$HOME/.config"
  if [ ! -d $XDG_CONFIG_HOME ]; then
    mkdir $XDG_CONFIG_HOME
  fi
fi

ln -sf $DOT_DIR/.zshenv $HOME/
ln -sf $DOT_DIR/.vimrc $HOME/
ln -sf $DOT_DIR/.tmux.conf $HOME/
ln -sf $DOT_DIR/.config/* $XDG_CONFIG_HOME/

