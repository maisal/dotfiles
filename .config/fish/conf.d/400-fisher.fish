if status --is-interactive

echo -e "\e[32mload\e[m 400-fisher"

if ! type -q fisher; and type -q curl
  curl -sL https://git.io/fisher | source && fisher update
end

end
