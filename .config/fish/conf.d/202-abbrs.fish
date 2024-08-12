if status --is-interactive

echo -e "\e[32mload\e[m 202-abbrs"

  if test (uname) = 'Darwin' -a (uname -m) = 'arm64'
    abbr -ag X86 'arch --arch=x86_64 '
    abbr -ag ARM 'arch --arch=arm64 '
    type -q trash
      and abbr -ag rm 'trash -Fv'
  end
  type -q tree
    and abbr -ag tree 'tree -NC'
  abbr -ag psl 'ps aux | less'
  type -q rg
    and abbr -ag psg 'ps aux | rg'
    or abbr -ag psg 'ps aux | grep'
  abbr -ag pip 'python -mpip'
  abbr -ag pip2 'python2 -mpip'
  abbr -ag pip3 'python3 -mpip'
  if type -q jq
    abbr -ag pip_update "python -mpip list --outdated --format=json | jq -r '.[].name' | xargs python -mpip install -U pip"
    abbr -ag pip2_update "python2 -mpip list --outdated --format=json | jq -r '.[].name' | xargs python2 -mpip install -U pip"
    abbr -ag pip3_update "python3 -mpip list --outdated --format=json | jq -r '.[].name' | xargs python3 -mpip install -U pip"
  end
  abbr -ag cmake_uninstall 'xargs rmrf < install_manifest.txt'
  abbr -ag rsync 'rsync -achvzP -n'
  # git
  abbr -ag ga 'git add'
  abbr -ag gs 'git status'
  abbr -ag gd 'git diff'
  abbr -ag gc 'git commit'
  if type -q eza
    abbr -ag l "eza"
    abbr -ag ls "eza --icons=auto"
    abbr -ag la "eza --icons=auto -a"
    abbr -ag ll "eza --icons=auto -la"
    abbr -ag lt "eza --icons=auto -T -L3 --color=always | bat -p"
    abbr -ag ltl "eza --icons=auto -Tl -L3 --color=always | bat -p"
  else
    abbr -ag la "ls -a"
    abbr -ag ll "ls -lha"
  end
  type -q bat
    and abbr -ag cat "bat"
  type -q btm
    and abbr -ag top "btm -b"
  type -q delta
    and abbr -ag diff "delta"
  type -q duf
    and abbr -ag df "duf"
  type -q dust
    and abbr -ag du "dust -r"
  type -q gh
    and abbr -ag gist "gh gist"
end #if status --is-interactive
