# vim:set foldmethod=marker:

# PATHの設定{{{
export LANG=ja_JP.UTF-8
export PATH=/usr/local/bin/:$PATH
export PATH=/usr/local/sbin/:$PATH
export PATH=$PATH:$HOME/.bin/
export CPATH=$CPATH:/usr/local/include
export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/lib
export GOPATH=$HOME/golang
export PATH=$GOPATH/bin:$PATH
export PATH=/usr/local/opt/tcl-tk/bin:$PATH
export PATH=$PATH:$HOME/.nodebrew/current/bin
export PATH=$PATH:$HOME/.local/bin/
export PATH=$PATH:/opt/alps/bin
export PYTHONPATH="$HOME/.local/lib/python:$PYTHONPATH"
export JUPYTER_PATH="$HOME/.local/lib/python:$PYTHONPATH"
if [ ! -d $XDG_DATA_HOME/zsh ]; then
  mkdir $XDG_DATA_HOME/zsh
fi
# }}}

# aliasの設定{{{
disable r #zshのrコマンドを無効化
if type gls > /dev/null 2>&1; then
  alias ls='gls -F --color=auto'
  alias ll='gls -lha --color=auto'
  alias la='gls -a --color=auto'
else
  alias ls='ls -G -F'
  alias ll='ls -G -la'
  alias la='ls -G -a'
fi
alias eng='LANG=C LANGUAGE=C LC_ALL=C'
alias mkdir='mkdir -p -v'
alias mv=' gtimeout 8 gmv -iv'
alias rm=' gtimeout 8 grm -Iv --one-file-system'
alias tmux='tmux -2'
alias rename='rename -v'
alias cp='cp -iv'
alias rsync='rsync -achv --progress --append-verify'
alias pip_update="pip list --outdated --format=json | jq -r '.[].name' | xargs pip install -U pip"
alias pip3_update="pip3 list --outdated --format=json | jq -r '.[].name' | xargs pip3 install -U pip"
alias gpg='LANG=C gpg'
alias op_signin='eval $(op signin)'
alias cot='open -a /Applications/CotEditor.app $1'
alias psa='ps aux'
# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

# グローバルエイリアス
alias -g L='| less'
alias -g G='| rg '
#}}}

# user file-creation mask
umask 022

# ZLEの設定{{{
bindkey -e
#}}}

## プロンプトの設定{{{
local C_ROOT="%{[31m%}"    # 31: red
local C_LOCAL="%{[36m%}"   # 36: cyan
local C_REMOTE="%{[35m%}"  # 35: magenta
local C_RESET="%{[m%}"
case ${UID} in
0)
	PROMPT="${C_ROOT}%n@%m(%h%)${C_RESET}# "
	PROMPT2="%_> "
	RPROMPT="[%~]"
	SPROMPT="%r is correct? [n,y,a,e]: "
	[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
	PROMPT="${C_ROOT}%n@%B%m%b(%h%)${C_RESET}# "
	;;
*)
	PROMPT="${C_LOCAL}%n(%h%)${C_RESET}%% " 
	PROMPT2="%_> "
	RPROMPT="[%~]"
	SPROMPT="%r is correct? [n,y,a,e]: "
	[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
	PROMPT="${C_REMOTE}%n@%B%m%b(%h%)${C_RESET}%% "
	;;
esac
# コマンド実行後は右プロンプトを消す
setopt transient_rprompt

## タイトルバーに各種情報を表示
case "${TERM}" in
kterm*|xterm)
	precmd() {
	    echo -ne "\033]0;${LOGNAME}@${HOST%%.*}:${PWD}\007"
	}
	;;
esac
#}}}

# LS_COLRSの設定{{{
if [ -f $XDG_CONFIG_HOME/dircolors/dircolors ]; then
  dircolors_path=$XDG_CONFIG_HOME/dircolors/dircolors
  if type dircolors > /dev/null 2>&1; then
    eval $(dircolors $dircolors_path)
  elif type gdircolors > /dev/null 2>&1; then
    eval $(gdircolors $dircolors_path)
  fi
fi

# zshの補完にも同じ色を設定
if [ -n "$LS_COLORS" ]; then
    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi
#}}}

## 補完
autoload -U compinit
compinit
# ディレクトリ名を入力するだけで移動
setopt auto_cd 
# 自動でpushd
setopt auto_pushd
# 重複するディレクトリはpushdしない
setopt pushd_ignore_dups
# 存在しないコマンド入力時に修正を提案
setopt correct
# 補完候補リストを詰めて表示
setopt list_packed 
# 補完候補リスト表示時にビープ音を鳴らさない
setopt nolistbeep 

## 履歴
# 履歴ファイル
HISTFILE=$XDG_DATA_HOME/zsh/zsh_history
# メモリに保存する履歴の数
HISTSIZE=10000
# ファイルに保存する履歴の数
SAVEHIST=10000
# 同じコマンドを保存対象外とする
setopt hist_ignore_dups
# 複数のシェル間で履歴を共有する
setopt share_history
# historyコマンド自体は履歴に追加しない
setopt hist_no_store
# 余分な空白を除去して履歴に追加する
setopt hist_reduce_blanks
# スペースではじめたコマンドは履歴に追加しない
setopt hist_ignore_space

autoload -Uz colors
colors

autoload -U promptinit
promptinit

# ヘルプコマンド
autoload -Uz run-help
autoload run-help-git
autoload run-help-svn
autoload run-help-svk
#unalias run-help
alias help=run-help

# 履歴検索機能
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end 

## Zshの挙動
# パスの最後に付けたスラッシュを勝手に除去させない
setopt noautoremoveslash
# aliasの場合もaliasを展開して補完対象を探したりする
setopt complete_aliases



export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# auto zcompile
if [ -f $XDG_CONFIG_HOME/zsh/.zshrc.zwc ]; then
  zcompile $XDG_CONFIG_HOME/zsh/.zshrc
elif [ $XDG_CONFIG_HOME/zsh/.zshrc -nt $XDG_CONFIG_HOME/zsh/.zshrc.zwc ]; then
  zcompile $XDG_CONFIG_HOME/zsh/.zshrc
fi

declare -A ZPLGM
ZPLGM[HOME_DIR]=$XDG_CONFIG_HOME/zplugin
ZPLGM[BIN_DIR]=$ZPLGM[HOME_DIR]/bin
ZPLGM[PLUGINS_DIR]=$ZPLGM[HOME_DIR]/plugins

### Added by Zplugin's installer
source "$ZPLGM[BIN_DIR]/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin's installer chunk
zplugin load zsh-users/zsh-history-substring-search

# bindkey for zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# syntax highlight (must be at the end of .zshrc)
zplugin light zsh-users/zsh-autosuggestions
zplugin ice wait'!0'; zplugin load zsh-users/zsh-completions
zplugin ice wait'!0'; zplugin load zsh-users/zsh-syntax-highlighting
zplugin ice wait'!0'; zplugin load zsh-users/zsh-history-substring-search

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND=''
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
