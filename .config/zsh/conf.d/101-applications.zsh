# vim/neovim
if type nvim > /dev/null 2>&1; then
  export EDITOR='nvim'
  alias vi='nvim'
  alias vim='nvim'
elif type vim > /dev/null 2>&1; then
  export EDITOR='vim'
else
  export EDITOR='vi'
fi

# fd
if type fd > /dev/null 2>&1; then
  export FD='fd'
elif type fdfind > /dev/null 2>&1; then
  export FD='fdfind'
fi

# less
export LESS='-R'
export LESSHISTFILE=-

# Docker
export DOCKER_CONFIG=$XDG_CONFIG_HOME/docker

# iTerm2
export ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX=YES
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
