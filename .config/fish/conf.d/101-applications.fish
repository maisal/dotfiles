if status --is-interactive

# vim/neovim
if type -q nvim
  set -gx EDITOR nvim
  alias vi 'nvim'
  alias vim 'nvim'
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

# gnupg
set -x GNUPGHOME $XDG_CONFIG_HOME/gnupg

# Docker
set -x DOCKER_CONFIG $XDG_CONFIG_HOME/docker

end
