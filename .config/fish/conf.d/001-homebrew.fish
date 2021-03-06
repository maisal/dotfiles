if status --is-login

if test (uname) = 'Darwin'
  type -q /usr/local/bin/brew
    and set -x HOMEBREW_ROOT /usr/local
  type -q /opt/homebrew/bin/brew
    and set -x HOMEBREW_ROOT /opt/homebrew
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
  set -x HOMEBREW_CASK_OPTS "--appdir=/Applications"
end

end
