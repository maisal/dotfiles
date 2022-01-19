if status --is-login

echo -e "\e[32mload\e[m 000-env"

umask 022

# reset PATH variable
if test (uname) = 'Darwin'
  set -x PATH
  eval (/usr/libexec/path_helper -c|/usr/bin/sed -e "s/setenv/set -x/" -e "s/\"//g" -e "s/:/ /g" -e "s/;//")
end

if locale -a|grep -qE "ja_JP\.(UTF-8|utf8)"
  set -x LANG ja_JP.UTF-8
else if locale -a|grep -qE "en_US\.(UTF-8|utf8)"
  set -x LANG en_US.UTF-8
else
  set -x LANG C.UTF-8
end

set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_CACHE_HOME $HOME/.cache
set -x XDG_DATA_HOME $HOME/.local/share

test -d $XDG_CONFIG_HOME
  or mkdir -p $XDG_CONFIG_HOME
test -d $XDG_CACHE_HOME
  or mkdir -p $XDG_CACHE_HOME
test -d $XDG_DATA_HOME
  or mkdir -p $XDG_DATA_HOME

not string match -q /usr/local/bin $PATH
  and set -x PATH /usr/local/bin $PATH
not string match -q /usr/local/sbin $PATH
  and set -x PATH /usr/local/sbin $PATH
if not string match -q $HOME/.local/bin $PATH
  set -x PATH $HOME/.local/bin $PATH
  test -d $HOME/.local/bin
    or mkdir -p $HOME/.local/bin
end

end # if status --is-login
