# keybind
bindkey -e

# completion
autoload -U compinit
compinit
setopt auto_cd 
setopt auto_pushd
setopt pushd_ignore_dups
setopt correct
setopt list_packed 
setopt nolistbeep 

# history
[ ! -d $XDG_DATA_HOME/zsh ] && mkdir -p -v $XDG_DATA_HOME/zsh
HISTFILE=$XDG_DATA_HOME/zsh/history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt share_history
setopt hist_no_store
setopt hist_reduce_blanks
setopt hist_ignore_space

# history search
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end 

# color
autoload -Uz colors
colors

# prompt
autoload -U promptinit
promptinit

# help
autoload -Uz run-help
autoload run-help-git
autoload run-help-svn
autoload run-help-svk
#unalias run-help
alias help=run-help

setopt noautoremoveslash
setopt complete_aliases
