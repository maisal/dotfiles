if [ -f $XDG_CONFIG_HOME/dircolors/dircolors ]; then
  dircolors_path=$XDG_CONFIG_HOME/dircolors/dircolors
  if type dircolors > /dev/null 2>&1; then
    eval $(dircolors $dircolors_path)
  elif type gdircolors > /dev/null 2>&1; then
    eval $(gdircolors $dircolors_path)
  fi
fi

# for completion
if [ -n "$LS_COLORS" ]; then
    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi
