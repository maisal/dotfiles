if status --is-interactive

echo -e "\e[32mload\e[m 301-prompt"

set -x STARSHIP_CONFIG $XDG_CONFIG_HOME/starship/fish.toml
type -q starship 
  and starship init fish | source

end
