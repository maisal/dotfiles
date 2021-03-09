if [ `uname` = 'Darwin' ]; then
  [ -x /usr/local/bin/brew ] && export HOMEBREW_ROOT=/usr/local
  [ -x /opt/homebrew/bin/brew ] && export HOMEBREW_ROOT=/opt/homebrew

  if [ -n "$HOMEBREW_ROOT" ]; then
    export PATH=$HOMEBREW_ROOT/bin:$PATH
    export PATH=$HOMEBREW_ROOT/sbin:$PATH
    export HOMEBREW_CASK_OPTS="--appdir=/Applications"
    typeset -gU PATH
  fi
fi
