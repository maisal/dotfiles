if type starship > /dev/null 2>&1; then
  export STARSHIP_CONFIG=$XDG_CONFIG_HOME/starship/zsh.toml
  eval "$(starship init zsh)"
else
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
fi
