if status --is-interactive

echo "load 102-tokens"

function decrypt
  cat $argv | openssl pkeyutl -decrypt -inkey ~/.keys/rsa_private.pem
end

# todoist
if test -e ~/.tokens/todoist.enc
  set -x TODOIST_API_TOKEN (decrypt ~/.tokens/todoist.enc)
end

functions -e decrypt

end # if status --is-interactive
