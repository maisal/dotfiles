# vim:set foldmethod=marker:
if status --is-login; or test (basename $SHELL) = "bash"

echo "load 002-languages"

#{{{ C/C++
set -x CPATH $CPATH /usr/local/include
set -x LIBRARY_PATH $LIBRARY_PATH /usr/local/lib
if test -n "$HOMEBREW_ROOT"
  set -x CPATH $CPATH $HOMEBREW_ROOT/include
  set -x LIBRARY_PATH $LIBRARY_PATH $HOMEBREW_ROOT/lib
  ## llvm
  if test -d $HOMEBREW_ROOT/opt/llvm
    set -x CPATH $CPATH $HOMEBREW_ROOT/opt/llvm/include
    set -x LDFLAGS -L$HOMEBREW_ROOT/opt/llvm/lib
    set -x CPPFLAGS -I$HOMEBREW_ROOT/opt/llvm/include
    set -x LIBRARY_PATH $LIBRARY_PATH $HOMEBREW_ROOT/opt/llvm/lib
  end
  ## openblas
  if test -d $HOMEBREW_ROOT/opt/openblas
    set -x CPATH $CPATH $HOMEBREW_ROOT/opt/openblas/include
    set -x LIBRARY_PATH $LIBRARY_PATH $HOMEBREW_ROOT/opt/openblas/lib
    set -x LDFLAGS $LDFLAGS -L$HOMEBREW_ROOT/opt/openblas/lib
    set -x CPPFLAGS $CPPFLAGS -I$HOMEBREW_ROOT/opt/openblas/include
    set -x PKG_CONFIG_PATH $PKG_CONFIG_PATH $HOMEBREW_ROOT/opt/openblas/lib/pkgconfig
  end
  if test -d $HOMEBREW_ROOT/opt/zlib
    set -x CPATH $CPATH $HOMEBREW_ROOT/opt/zlib/liclude
    set -x LIBRARY_PATH $LIBRARY_PATH $HOMEBREW_ROOT/opt/zlib/lib
    set -x LDFLAGS $LDFLAGS -L$HOMEBREW_ROOT/opt/zlib/lib
    set -x CPPFLAGS $CPPFLAGS -I$HOMEBREW_ROOT/opt/zlib/include
  end
end
#}}}

#{{{ python
type -q $HOMEBREW_ROOT/bin/python3
  and set -x PYTHON $HOMEBREW_ROOT/bin/python3
type -q $HOMEBREW_ROOT/bin/python3
  and set -x PYTHON3 $HOMEBREW_ROOT/bin/python3
# test (uname) = Darwin -a -d /Applications/Python\ 3.10
#   and set -x PATH /Library/Frameworks/Python.framework/Versions/3.10/bin $PATH
set -x PYTHONPATH $HOME/.local/lib/python $PYTHONPATH
set -x JUPYTER_PATH $PYTHONPATH
set -x IPYTHONDIR $XDG_CONFIG_HOME/jupyter
set -x JUPYTER_CONFIG_DIR $IPYTHONDIR
set -x JUPYTERLAB_LOG_PATH $HOME/.local/var/log/jupyter/lab

## venv
set -x VIRTUAL_ENV_DISABLE_PROMPT 1
#}}}

#{{{ Node.js
if test -n "$HOMEBREW_ROOT"
  set -x NODEBREW_ROOT $HOMEBREW_ROOT/var/nodebrew
else
  set -x NODEBREW_ROOT $HOME/.nodebrew
end
set -x PATH $PATH $NODEBREW_ROOT/current/bin
set -x NODE_REPL_HISTORY $XDG_DATA_HOME/node_repl_history
set -x NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/npmrc
#}}}

#{{{ rust
set -x RUSTUP_HOME $XDG_DATA_HOME/rustup
set -x CARGO_HOME $XDG_DATA_HOME/cargo
set -x PATH $CARGO_HOME/bin $PATH
#}}}

#{{{ GO
set -x GOPATH $XDG_DATA_HOME/go
set -x PATH $GOPATH/bin $PATH
#}}}

#{{{ sqlite3
type -q $HOMEBREW_ROOT/opt/sqlite/bin/sqlite3
  and set -x PATH $HOMEBREW_ROOT/opt/sqlite/bin $PATH
#}}}

#{{{ lua
type -q $HOMEBREW_ROOT/opt/luajit-openresty/bin/luajit
  and set -x PATH $HOMEBREW_ROOT/opt/luajit-openresty/bin $PATH
type -q $HOME/build/lua-language-server/bin/macOS/lua-language-server
  and set -x PATH $PATH $HOME/build/lua-language-server/bin/macOS
#}}}

end # if status --is-login
