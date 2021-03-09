# fzf
export FZF_DEFAULT_COMMAND=''
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'
export FZF_FIND_FILE_COMMAND="fd -HI . \$dir"
export FZF_CD_COMMAND="fd --type d . \$dir"
export FZF_CD_WITH_HIDDEN_COMMAND="fd --type d -HI . \$dir"
export FZF_OPEN_COMMAND="fd -HI . \$dir"
[ -f $HOMEBREW_ROOT/opt/fzf/shell/key-bindings.zsh ] && source $HOMEBREW_ROOT/opt/fzf/shell/key-bindings.zsh
[ -f $HOMEBREW_ROOT/opt/fzf/shell/completion.zsh ] && source $HOMEBREW_ROOT/opt/fzf/shell/completion.zsh
