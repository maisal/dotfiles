if status --is-interactive

echo -e "\e[32mload\e[m 401-plugins"

# fzf
if type -q fzf
  set -x FZF_LEGACY_KEYBINDINGS 0
# set -x FZF_COMPLETE 1
  set -x FZF_DEFAULT_COMMAND ''
  set -x FZF_DEFAULT_OPTS "--ansi --height 40% --reverse --border"
  set -x FZF_COMPLETION_TRIGGER '**'

  if type -q fd
    set -x FZF_FIND_FILE_COMMAND "$FD --color=always -HIL . \$dir"
    set -x FZF_CD_COMMAND "$FD --color=always --type d -IL . \$dir"
    set -x FZF_CD_WITH_HIDDEN_COMMAND "$FD --color=always --type d -HIL . \$dir"
    set -x FZF_OPEN_COMMAND "$FD --color=always -HIL . \$dir"
  end
end

# iTerm2
test -n "$ITERM_SESSION_ID"; and type -q tmux
  and set -x ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX YES
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish ; or true

end
