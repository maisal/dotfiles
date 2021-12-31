if status --is-interactive

echo "load 201-alias"


if test (uname) = 'Darwin'
  alias ql 'qlmanage -p $argv > /dev/null 2>&1'
  if test -d $HOMEBREW_ROOT/opt/coreutils
    alias ls "gls -F --color=auto"
    alias mv ' gtimeout 8 gmv -iv'
    alias rm ' gtimeout 8 grm -Iv --one-file-system --'
    alias rmr ' gtimeout 8 grm -r -Iv --one-file-system --'
    alias rmrf ' gtimeout 8 grm -rf -v --one-file-system --'
    alias sed 'gsed'
  else
    alias ls "ls -G -F"
    alias mv ' mv -iv'
    alias rm ' rm -iv --'
    alias rmr ' rm -iv -r --'
    alias rmrf ' rm -v -rf --'
  end
else if test (uname) = 'Linux'
  alias ls "ls -F --color=auto"
  alias mv ' timeout 8 mv -iv'
  alias rm ' timeout 8 rm -Iv --one-file-system --'
  alias rmr ' timeout 8 rm -r -Iv --one-file-system --'
  alias rmrf ' timeout 8 rm -rf -v --one-file-system --'
end

alias mkdir 'mkdir -p -v'
alias cp 'cp -iv'
alias python 'python3'
alias reload "exec fish"
alias etmux "$EDITOR $XDG_CONFIG_HOME/tmux/tmux.conf"
if type -q $FD; and type -q fzf
  alias conf "$FD --color=always --type f -HIL . $XDG_CONFIG_HOME|fzf --ansi|xargs -r $EDITOR"
  alias envim "$EDITOR ($FD --color=always --type f -e lua -HIL . $XDG_CONFIG_HOME/nvim|fzf --ansi; or echo $XDG_CONFIG_HOME/nvim/init.lua)"
end
if type -q clang
  alias clang-omp 'clang  -Xpreprocessor -fopenmp -lomp'
  alias clang++-omp 'clang++  -Xpreprocessor -fopenmp -lomp'
end
type -q exa
  and alias exa 'exa -F'
type -q tmux
  and alias tmux 'tmux -2'
type -q op
  and alias op_signin 'eval (op signin)'
type -q speedtest
  and alias st 'speedtest -L |rg -o "(\d+\s+)OPEN Project" -r \'$1\' -m 1 | xargs speedtest -s'
type -q podman
  and alias docker podman

end
