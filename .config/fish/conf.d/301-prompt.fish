if status --is-interactive

echo "load 301-prompt"

set -x STARSHIP_CONFIG $XDG_CONFIG_HOME/starship/fish.toml
type -q starship 
  and starship init fish | source

end
