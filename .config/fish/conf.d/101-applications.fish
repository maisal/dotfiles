if status --is-interactive

echo -e "\e[32mload\e[m 101-applications"

# vim/neovim
if type -q nvim
  set -gx EDITOR nvim
  set -x MANPAGER "col -b|nvim -Rc 'set ft=man'"
  alias vim 'nvim'
  alias vi 'nvim'
else
  set -gx EDITOR vi
end

# bat
type -q bat
  and set -x BAT_THEME "Monokai Extended Origin"

type -q exa
  and set -x TIME_STYLE "long-iso"

# fd
if type -q fd
  set -x FD fd
else if type -q fdfind
  set -x FD fdfind
end

# fzf
set -x FZF fzf-tmux

# less
set -x LESS '-R'
set -x LESSHISTFILE -

# openssl
set -x PATH $HOMEBREW_ROOT/opt/openssl@1.1/bin $PATH

# gnupg
set -x GNUPGHOME $XDG_CONFIG_HOME/gnupg

# Docker
set -x DOCKER_CONFIG $XDG_CONFIG_HOME/docker

# github
type -q gh
  and eval (gh completion -s fish|source)

if type -q volta
  set -x VOLTA_HOME $XDG_DATA_HOME/volta
  set -x PATH $VOLTA_HOME/bin $PATH
end

# op
test -f $XDG_CONFIG_HOME/op/plugin.sh
  source $XDG_CONFIG_HOME/op/plugins.sh

# zoxide
if type -q zoxide
  zoxide init fish | source
  set -x _ZO_DATA_DIR $XDG_DATA_HOME/zoxide
end

end # if status --is-interactive
