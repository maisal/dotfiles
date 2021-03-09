umask 022

if locale -a|grep -qE "ja_JP\.(UTF-8|utf8)"; then
  export LANG=ja_JP.UTF-8
elif locale -a|grep -qE "en_US\.(UTF-8|utf8)"; then
  export LANG=en_US.UTF-8
else
  export LANG=C.UTF-8
fi

export XDG_CONFIG_HOME=$HOME/.config
[ ! -d $XDG_CONFIG_HOME ] && mkdir -pv $XDG_CONFIG_HOME
export XDG_CACHE_HOME=$HOME/.cache
[ ! -d $XDG_CACHE_HOME ] && mkdir -pv $XDG_CACHE_HOME
export XDG_DATA_HOME=$HOME/.local/share
[ ! -d $XDG_DATA_HOME ] && mkdir -pv $XDG_DATA_HOME

export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=$HOME/.local/bin:$PATH

typeset -gU PATH
