if status --is-interactive

echo -e "\e[32mload\e[m 100-dircolors"

if test -f $XDG_CONFIG_HOME/dircolors/dircolors
  set dircolors_path $XDG_CONFIG_HOME/dircolors/dircolors
  if type -q dircolors
    set -x LS_COLORS (dircolors -c $dircolors_path | string split ' ')[3]
  else if type -q gdircolors
    set -x LS_COLORS (gdircolors -c $dircolors_path | string split ' ')[3]
  end
  # The value should always be quoted but be conservative and check first.
  if string match -qr '^([\'"]).*\1$' -- $LS_COLORS
    set -x LS_COLORS (string match -r '^.(.*).$' $LS_COLORS)[2]
  end
end

end # if status --is-interactive
