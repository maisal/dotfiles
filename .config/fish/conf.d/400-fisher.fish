if status --is-interactive

echo "load 400-fisher"

if ! type -q fisher; and type -q curl
  curl -sL https://git.io/fisher | source && fisher update
end

end
