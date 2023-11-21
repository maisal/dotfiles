if status --is-interactive

echo -e "\e[32mload\e[m 401-plugins"

# fzf
if type -q fzf
  set -x FZF_TMUX 1
  set -x FZF_TMUX_OPTS "-p 80%"
  set -x FZF_LEGACY_KEYBINDINGS 0
# set -x FZF_COMPLETE 1
  set -x FZF_DEFAULT_COMMAND ''
  set -x FZF_DEFAULT_OPTS "--ansi --height 40% --reverse --border"
  set -x FZF_COMPLETION_TRIGGER '**'
  set -x FZF_PREVIEW_FILE_CMD "bat -n 10"
  set -x FZF_PREVIEW_DIR_CMD "exa"
  set -x FZF_PREVIEW_CMD "if test -d {};exa  --no-permissions --no-time --no-user -l --sort type {};else;bat -p --color=always {};end"

  if type -q $FD
    set -x FZF_FIND_FILE_COMMAND "$FD --color=always -HIL . \$dir"
    set -x FZF_FIND_FILE_OPTS "--preview '$FZF_PREVIEW_CMD'"
    set -x FZF_CD_COMMAND "$FD --color=always --type d -IL . \$dir"
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
