disable r

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

if type clang > /dev/null 2>&1; then
  alias clang-omp='clang  -Xpreprocessor -fopenmp -lomp'
  alias clang++-omp='clang++  -Xpreprocessor -fopenmp -lomp'
fi
alias sudo='sudo '
alias mkdir='mkdir -p -v'
if type tmux > /dev/null 2>&1; then
  alias tmux='tmux -2'
fi
alias cp 'cp -iv'
alias python 'python3'
if type jq > /dev/null 2>&1; then
  alias pip_update="python -mpip list --outdated --format=json | jq -r '.[].name' | xargs python -mpip install -U pip"
  alias pip2_update="python2 -mpip list --outdated --format=json | jq -r '.[].name' | xargs python2 -mpip install -U pip"
  alias pip3_update="python3 -mpip list --outdated --format=json | jq -r '.[].name' | xargs python3 -mpip install -U pip"
fi
alias ezsh="$EDITOR \$($FD --color=always --type f -HIL '.zshrc$|\d+-.*zsh$' $ZDOTDIR|fzf --ansi || echo $ZDOTDIR/.zshrc)"
alias rzsh="source $XDG_CONFIG_HOME/fish/config.fish"
alias reload="exec zsh"
alias envim="$EDITOR \$($FD --color=always --type f -e lua -HIL . $XDG_CONFIG_HOME/nvim|fzf --ansi || echo $XDG_CONFIG_HOME/nvim/init.lua)"
if type speedtest-cli > /dev/null 2>&1; then
  alias speedtest="speedtest-cli --list | grep 'OPEN Project' | cut -d' ' -f1 | rev | cut -c 2- | rev | xargs speedtest-cli --server"
fi
