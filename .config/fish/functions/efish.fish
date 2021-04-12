function efish
  set filepath ($FD --color=always --type f -e fish -HIL '\d{3}-.*|config' $XDG_CONFIG_HOME/fish|fzf --ansi -q "$argv"; or echo $XDG_CONFIG_HOME/fish/config.fish)
  commandline -r "$EDITOR $filepath"
end
