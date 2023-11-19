# auto zcompile
if [ ! -f $ZDOTDIR/.zshrc.zwc -o $ZDOTDIR/.zshrc -nt $ZDOTDIR/.zshrc.zwc ]; then
  zcompile $ZDOTDIR/.zshrc
fi

# read conf.d/*.zsh
if [ -d $ZDOTDIR -a -r $ZDOTDIR -a -x $ZDOTRIR ]; then
  for i in $ZDOTDIR/conf.d/*; do
    if [[ ${i##*/} = *.zsh ]] && [ \( -f $i -o -L $i \) -a -r $i ]; then
      if [ ! -f ${i}.zwc -o $i -nt $i.zwc ]; then
        zcompile $i
      fi
      . $i
    fi
  done
fi

eval $(sheldon source)
