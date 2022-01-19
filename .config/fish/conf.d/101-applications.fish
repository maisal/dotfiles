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


# fd
if type -q fd
  set -x FD fd
else if type -q fdfind
  set -x FD fdfind
end

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

end # if status --is-interactive
