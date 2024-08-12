if status --is-interactive

echo -e "\e[32mload\e[m 401-plugins"

# fzf
if type -q fzf
  set -x FZF_TMUX 1
  set -x FZF_TMUX_OPTS "-p 80%"
  set -x FZF_LEGACY_KEYBINDINGS 0
# set -x FZF_COMPLETE 1
  set -x FZF_DEFAULT_COMMAND ''
  set -x FZF_DEFAULT_OPTS "--ansi --height 40%"
  set -x FZF_COMPLETION_TRIGGER '**'
  set -x FZF_PREVIEW_FILE_CMD "bat -n 10"
  set -x FZF_PREVIEW_DIR_CMD "exa"
  set -x FZF_PREVIEW_CMD "if test -d {};exa  --no-permissions --no-time --no-user -l --sort type {};else;/opt/homebrew/bin/bat -p --color=always {};end"

  if type -q $FD
    set -x FZF_FIND_FILE_COMMAND "$FD --color=always -HIL . \$dir"
    set -x FZF_FIND_FILE_OPTS "--preview '$FZF_PREVIEW_CMD'"
    set -x FZF_CTRL_T_COMMAND "$FD --ignore-file $XDG_CONFIG_HOME/fd/fzf-ignore --color=always -L . \$dir"
    set -x FZF_ALT_C_COMMAND "$FD --ignore-file $XDG_CONFIG_HOME/fd/fzf-ignore --color=always --type d -d 5 -HL . \$dir"
    set -x FZF_ALT_C_OPTS "--preview '/opt/homebrew/bin/exa --no-permissions --no-time --no-user -l --sort type'"
    set -x FZF_CD_WITH_HIDDEN_COMMAND "$FD --color=always --type d -HIL . \$dir"
    set -x FZF_OPEN_COMMAND "$FD --color=always -HIL . \$dir"
  end
end

# skim
if type -q sk
  set -x SKIM_DEFAULT_COMMAND ''
  set -x SKIM_DEFAULT_OPTIONS "--ansi --height 40% --reverse --border --tiebreak=-end"
end

end
