# vim:set foldmethod=marker:
#{{{ C/C++
export CPATH=$CPATH:/usr/local/include
export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/lib
if [ -n "$HOMEBREW_ROOT" ]; then
  export CPATH=$CPATH:$HOMEBREW_ROOT/include
  export LIBRARY_PATH=$LIBRARY_PATH:$HOMEBREW_ROOT/lib
  ## llvm
  export CPATH=$CPATH:$HOMEBREW_ROOT/opt/llvm/include
  export LIBRARY_PATH=$LIBRARY_PATH:$HOMEBREW_ROOT/opt/llvm/lib
  ## openblas
  export CPATH=$CPATH:$HOMEBREW_ROOT/opt/openblas/include
  export LIBRARY_PATH=$LIBRARY_PATH:$HOMEBREW_ROOT/opt/openblas/lib
  export LDFLAGS=$LDFLAGS:-L$HOMEBREW_ROOT/opt/openblas/lib
  export CPPFLAGS=$CPPFLAGS:-I$HOMEBREW_ROOT/opt/openblas/include
  export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$HOMEBREW_ROOT/opt/openblas/lib/pkgconfig
fi
#}}}

#{{{ python
if [ -d /Applications/Python\ 3.9 ]; then
  export PATH=$PATH:/Library/Frameworks/Python.framework/Versions/3.9/bin
fi
export PYTHONPATH=$HOME/.local/lib/python
export JUPYTER_PATH=$PYTHONPATH
export IPYTHONDIR=$XDG_CONFIG_HOME/jupyter
export JUPYTER_CONFIG_DIR=$IPYTHONDIR
export JUPYTERLAB_LOG_PATH=$HOME/.local/var/log/jupyter/lab

## venv
export VIRTUAL_ENV_DISABLE_PROMPT=1
#}}}

#{{{ Julia
export PYTHON=/usr/local/bin/python3
#}}}

#{{{ Node.js
if type nodebrew > /dev/null 2>&1; then
  export NODEBREW_ROOT=$HOME/.nodebrew
  export PATH=$PATH:$NODEBREW_ROOT/current/bin
fi
export NODE_REPL_HISTORY=$XDG_DATA_HOME/node_repl_history
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
#}}}

#{{{ rust
export RUSTUP_HOME=$XDG_DATA_HOME/rustup
export CARGO_HOME=$XDG_DATA_HOME/cargo
export PATH=$CARGO_HOME/bin:$PATH
#}}}

#{{{ GO
export GOPATH=$XDG_DATA_HOME/go
export PATH=$GOPATH/bin:$PATH
#}}}

typeset -gU PATH
