# auto zcompile
if [ ! -f $ZDOTDIR/.zshrc.zwc -o $ZDOTDIR/.zshrc -nt $ZDOTDIR/.zshrc.zwc ]; then
  zcompile $ZDOTDIR/.zshrc
fi

export SHELDON_CONFIG_DIR="$XDG_CONFIG_HOME/zsh/sheldon"
sheldon_zsh="$XDG_CONFIG_HOME/zsh/conf.d/sheldon.zsh"
sheldon_toml="$SHELDON_CONFIG_DIR/plugins.toml"
if [ ! -r "$sheldon_zsh" -o "$sheldon_toml" -nt "$sheldon_zsh" ]; then
  sheldon source > $sheldon_zsh
fi

# read conf.d/*.zsh
if [ -d $ZDOTDIR -a -r $ZDOTDIR -a -x $ZDOTRIR ]; then
  for i in $ZDOTDIR/conf.d/*; do
    if [[ ${i##*/} = *.zsh ]] && [ \( -f $i -o -L $i \) -a -r $i ]; then
      if [ ! -f ${i}.zwc -o $i -nt $i.zwc ]; then
        zcompile $i
      fi
      echo -e "\e[32mload\e[m ${i##*/}"
      source $i
    fi
  done
fi
