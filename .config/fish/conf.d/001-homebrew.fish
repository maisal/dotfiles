if status --is-login; or test (basename $SHELL) != "fish"

if status --is-interactive
  echo -e "\e[32mload\e[m 001-homebrew"
end

if test (uname) = 'Darwin'
  type -q /usr/local/bin/brew
    and set -x HOMEBREW_ROOT /usr/local
  type -q /opt/homebrew/bin/brew
    and set -x HOMEBREW_ROOT /opt/homebrew
  set -x HOMEBREW_CASK_OPTS "--appdir=/Applications"
else if test (uname) = 'Linux'
  type -q /home/linuxbrew/.linuxbrew/bin/brew
    and set -x HOMEBREW_ROOT /home/linuxbrew/.linuxbrew
  type -q $HOME/.linuxbrew/bin/brew
    and set -x HOMEBREW_ROOT $HOME/.linuxbrew
end

if test -n "$HOMEBREW_ROOT"
  not string match -q $HOMEBREW_ROOT/bin $PATH
    and set -x PATH $HOMEBREW_ROOT/bin $PATH
  not string match -q $HOMEBREW_ROOT/sbin $PATH
    and set -x PATH $HOMEBREW_ROOT/sbin $PATH
end

end # if status --is-login; or test (basename $SHELL) != "fish"
