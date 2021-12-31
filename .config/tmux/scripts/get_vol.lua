vol,mute=io.popen("osascript -e 'get Volume settings'"):read("*all"):match(".*output volume:(%d+).*output muted:(%l+).*")
vol=tonumber(vol)
if mute=="true" then
  icon="婢"
else
  icon="墳"
end

if vol==0 then
  bar=' '
elseif val < 13 then
  bar='_'
elseif val < 25 then
  bar='▁'
elseif val < 38 then
  bar='▂'
elseif val < 50 then
  bar='▃'
elseif val < 63 then
  bar='▄'
elseif val < 75 then
  bar='▅'
elseif val < 88 then
  bar='▆'
elseif val < 100 then
  bar='▇'
elseif val == 100 then
  bar='█'
end

print(icon.." "..bar)
