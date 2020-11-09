umask 022

# PATH{{{
set -x PATH /usr/local/bin/ $PATH
set -x PATH /usr/local/sbin/ $PATH
set -x PATH /usr/local/opt/tcl-tk/bin $PATH
set -x PATH $PATH $HOME/.bin
set -x PATH $PATH $HOME/.nodebrew/current/bin
set -x PATH $PATH $HOME/.local/bin
set -x PATH $HOME/.cargo/bin $PATH
set -x PATH $PATH /usr/local/opt/llvm/bin
set -x PATH $PATH /opt/alps/bin

## GO
set -x GOPATH $HOME/golang
set -x PATH $GOPATH/bin $PATH

## C
set -x CPATH $CPATH:/usr/local/include
set -x LIBRARY_PATH $LIBRARY_PATH:/usr/local/lib

# python
set -x PYTHONPATH $HOME/.local/lib/python
set -x JUPYTER_PATH $PYTHONPATH
# }}}

# Environment variables{{{
type nvim > /dev/null 2>&1
  and set -gx EDITOR nvim
  or set -gx EDITOR vim
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_CACHE_HOME $HOME/.cache
set -x XDG_DATA_HOME $HOME/.local/share
# CXX
set -x CXX g++
# homebrew
test (uname) = 'Darwin'
  and set -x HOMEBREW_CASK_OPTS "--appdir=/Applications"

set -x LDFLAGS "-L/usr/local/opt/openblas/lib"
set -x CPPFLAGS "-I/usr/local/opt/openblas/include"
# less
set -x LESS '-R'
set -x PAGER 'nvim -c "set ft=man" -'

# venv
set -x VIRTUAL_ENV_DISABLE_PROMPT 1

## tkinter
set -x PATH "/usr/local/opt/tcl-tk/bin" $PATH
set -x LDFLAGS "-L/usr/local/opt/tcl-tk/lib"
set -x CPPFLAGS "-I/usr/local/opt/tcl-tk/include"
set -x PKG_CONFIG_PATH "/usr/local/opt/tcl-tk/lib/pkgconfig"
set -x PYTHON_CONFIGURE_OPTS "--with-tcltk-includes='-I/usr/local/opt/tcl-tk/include' --with-tcltk-libs='-L/usr/local/opt/tcl-tk/lib -ltcl8.6 -ltk8.6'"

# jupyter lab
set -x JUPYTERLAB_LOG_PATH $HOME/.local/var/log/jupyter/lab

# iTerm2
set -x ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX YES
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish ; or true
# }}}

# aliases{{{
if test (uname) = 'Darwin'
  type gls > /dev/null 2>&1
    and alias ls "gls -F --color=auto"
    or alias ls "ls -G -F"

  type gmv > /dev/null 2>&1
    and alias mv ' gtimeout 8 gmv -iv'
    or alias mv ' mv -iv'

  if type grm > /dev/null 2>&1
    # rmにoptionを追加できないようにする。
      alias rm ' gtimeout 8 grm -Iv --one-file-system --'
      alias rmr ' gtimeout 8 grm -r -Iv --one-file-system --'
      alias rmrf ' gtimeout 8 grm -rf -v --one-file-system --'
  else
      alias rm ' rm -iv --'
      alias rmr ' rm -iv -r --'
      alias rmrf ' rm -v -rf --'
  end

  type gsed > /dev/null 2>&1
    and alias sed 'gsed'
end
alias mkdir 'mkdir -p -v'
alias tmux 'tmux -2'
alias cp 'cp -iv'
alias python 'python3'
alias pip_update "python -mpip list --outdated --format=json | jq -r '.[].name' | xargs python -mpip install -U pip"
alias pip2_update "python2 -mpip list --outdated --format=json | jq -r '.[].name' | xargs python2 -mpip install -U pip"
alias pip3_update "python3 -mpip list --outdated --format=json | jq -r '.[].name' | xargs python3 -mpip install -U pip"
alias gpg 'env LANG=C gpg'
alias efish "$EDITOR $XDG_CONFIG_HOME/fish/config.fish"
alias rfish "source $XDG_CONFIG_HOME/fish/config.fish"
alias reload "exec fish"
alias envim "$EDITOR $XDG_CONFIG_HOME/nvim/init.vim"
alias etmux "$EDITOR $XDG_CONFIG_HOME/tmux/tmux.conf"
alias speedtest "speedtest-cli --list | grep 'OPEN Project' | cut -d' ' -f1 | rev | cut -c 2- | rev | xargs speedtest-cli --server"
# }}}

# abbreviations{{{
if status --is-interactive
  abbr -ag tree 'tree -NC'
  abbr -ag psl 'ps aux | less'
  abbr -ag psg 'ps aux | rg'
  abbr -ag pip 'python -mpip'
  abbr -ag pip2 'python2 -mpip'
  abbr -ag pip3 'python3 -mpip'
  abbr -ag rsync 'rsync -achv --progress --append-verify -n'
  abbr -ag ga 'git add'
  abbr -ag gs 'git status'
  abbr -ag gd 'git diff'
  abbr -ag gc 'git commit'
  if type exa > /dev/null 2>&1
    abbr -ag ls "exa"
    abbr -ag la "exa -a"
    abbr -ag ll "exa -lha"
    abbr -ag lt "exa -Tlh -L2"
  else
    abbr -ag la "ls -a"
    abbr -ag ll "ls -lha"
  end
end
# }}}

# LS_COLORS{{{
if test -f $XDG_CONFIG_HOME/dircolors/dircolors
  set dircolors_path $XDG_CONFIG_HOME/dircolors/dircolors
  if type dircolors > /dev/null 2>&1
    set -x LS_COLORS (dircolors -c $dircolors_path | string split ' ')[3]
  else if type gdircolors > /dev/null 2>&1
    set -x LS_COLORS (gdircolors -c $dircolors_path | string split ' ')[3]
  end
    # The value should always be quoted but be conservative and check first.
    if string match -qr '^([\'"]).*\1$' -- $LS_COLORS
    set LS_COLORS (string match -r '^.(.*).$' $LS_COLORS)[2]
  end
end
# }}}

# plugin setting{{{
# fzf
set -x FZF_LEGACY_KEYBINDINGS 0
# set -x FZF_COMPLETE 1
set -x FZF_DEFAULT_COMMAND ''
set -x FZF_DEFAULT_OPTS "--height 40% --reverse --border"
set -x FZF_COMPLETION_TRIGGER '**'

set -x FZF_FIND_FILE_COMMAND "fd -HI . \$dir"
set -x FZF_CD_COMMAND "fd --type d . \$dir"
set -x FZF_CD_WITH_HIDDEN_COMMAND "fd --type d -HI . \$dir"
set -x FZF_OPEN_COMMAND "fd -HI . \$dir"

# bobthefish
set -x theme_date_format "+%Y/%m/%d(%a) %H:%M:%S"
set -x theme_color_scheme zenburn
# }}}
