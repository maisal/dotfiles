declare -A ZPLGM
ZPLGM[HOME_DIR]=$XDG_CONFIG_HOME/zinit
ZPLGM[BIN_DIR]=$ZPLGM[HOME_DIR]/bin
ZPLGM[PLUGINS_DIR]=$ZPLGM[HOME_DIR]/plugins


### Added by zinit's installer
source "$ZPLGM[BIN_DIR]/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of zinit's installer chunk
zinit load zsh-users/zsh-history-substring-search

# bindkey for zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# syntax highlight (must be at the end of .zshrc)
zinit light zsh-users/zsh-autosuggestions
zinit ice wait'!0'; zinit load zsh-users/zsh-completions
zinit ice wait'!0'; zinit load zsh-users/zsh-syntax-highlighting
zinit ice wait'!0'; zinit load zsh-users/zsh-history-substring-search
