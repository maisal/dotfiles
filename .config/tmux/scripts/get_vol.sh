#!/bin/bash

vol=(`osascript -e 'get Volume settings' | rg -o 'output volume:(\d+), .+output muted:(true|false)' -r '$1 $2'`);

if [ ${vol[1]} = 'true' ];then
  icon='婢';
else
  icon='墳';
fi

if [ ${vol[0]} -eq 0 ];then
  bar=' '
elif [ ${vol[0]} -lt 13 ];then
  bar='_'
elif [ ${vol[0]} -lt 25 ];then
  bar='▁'
elif [ ${vol[0]} -lt 38 ];then
  bar='▂'
elif [ ${vol[0]} -lt 50 ];then
  bar='▃'
elif [ ${vol[0]} -lt 63 ];then
  bar='▄'
elif [ ${vol[0]} -lt 75 ];then
  bar='▅'
elif [ ${vol[0]} -lt 88 ];then
  bar='▆'
elif [ ${vol[0]} -lt 100 ];then
  bar='▇'
elif [ ${vol[0]} -eq 100 ];then
  bar='█'
fi

echo "$icon $bar"
