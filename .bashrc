echo -e "\e[32mload\e[m bashrc"

if [[ $- == *i* ]]; then
  [ ! -d $XDG_DATA_HOME/bash ] && mkdir -p $XDG_DATA_HOME/bash
  export HISTFILE=$XDG_DATA_HOME/bash/history

  if [ `uname` = 'Darwin' ]; then
    if [ -d $HOMEBREW_ROOT/opt/coreutils ]; then
      alias ls='gls -F --color=auto'
      alias mv=' gtimeout 8 gmv -iv'
      alias rm=' gtimeout 8 grm -Iv --one-file-system --'
      alias rmr=' gtimeout 8 grm -r -Iv --one-file-system --'
      alias rmrf=' gtimeout 8 grm -rf -v --one-file-system --'
      alias sed='gsed'
    else
      alias ls="ls -G -F"
      alias mv=' mv -iv'
      alias rm=' rm -iv --'
      alias rmr=' rm -iv -r --'
      alias rmrf=' rm -v -rf --'
    fi
  elif [ `uname` = 'Linux' ]; then
    alias ls="ls -F --color=auto"
    alias mv=' timeout 8 mv -iv'
    alias rm=' timeout 8 rm -Iv --one-file-system --'
    alias rmr=' timeout 8 rm -r -Iv --one-file-system --'
    alias rmrf=' timeout 8 rm -rf -v --one-file-system --'
  fi

  alias la='ls -a'
  alias ll='ls -lh'
  alias lla='ls -lha'
  alias lal='ls -alh'
  alias lll='ls -alh'
  alias mkdir='mkdir -pv'
  alias sudo='sudo '

  if type starship > /dev/null 2>&1; then
    export STARSHIP_CONFIG=$XDG_CONFIG_HOME/starship/bash.toml
    eval "$(starship init bash)"
  fi
fi
