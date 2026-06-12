# 1. Environment
export HISTFILE=${XDG_DATA_HOME}/zsh/history
export HISTSIZE=100000
export SAVEHIST=100000
export ANTIDOTE_DIR=${HOME}/.antidote
export ZSH_CACHE_DIR=${XDG_CACHE_HOME}/zsh
export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"
export FZF_CTRL_R_OPTS="
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'
  --height 40%
  --layout reverse
  --border"

# 2. Options

# History options
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE
setopt EXTENDED_HISTORY
setopt HIST_VERIFY

# Directory options
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_MINUS
setopt NUMERIC_GLOB_SORT

# 3. Plugins
if [[ ! -d $ANTIDOTE_DIR ]]; then
  git clone https://github.com/mattmc3/antidote $ANTIDOTE_DIR
fi

source ${ANTIDOTE_DIR}/antidote.zsh
antidote load

# 4. Keybindings
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# 5. Functions
function mkcd() {
    mkdir --parents -- "$1" && cd -- "$1"
}

# What's running on this port?
function rop() {
    lsof -nP -iTCP:"$1" -sTCP:LISTEN
}

# Yazi shell wrapper
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# Switch to a tmux session via fzf, creating it from the query if none matches
function tm() {
    local session
    session=$(tmux list-sessions -F '#{session_name}' 2>/dev/null \
        | fzf --border --height 40% --layout reverse \
              --bind 'enter:accept-or-print-query') || return
    [ -z "$session" ] && return
    tmux has-session -t "$session" 2>/dev/null || tmux new-session -d -s "$session"
    if [ -n "$TMUX" ]; then
        tmux switch-client -t "$session"
    else
        tmux attach-session -t "$session"
    fi
}

function brewup () {
  brew update
  brew upgrade
  brew upgrade --cask
  if command -v mas >/dev/null 2>&1; then
    mas upgrade
  else
    echo "mas not installed; skipping Mac App Store upgrades (install with: brew install mas)"
  fi
  brew cleanup
}

# 6. Aliases
alias ...="../.."
alias ....="../../.."
alias .....="../../../.."
alias ......="../../../../.."

alias cd..='cd ..'
alias -- -="cd -"
alias 1="cd -1"
alias 2="cd -2"
alias 3="cd -3"
alias 4="cd -4"
alias 5="cd -5"
alias 6="cd -6"
alias 7="cd -7"
alias 8="cd -8"
alias 9="cd -9"

alias h="history"
alias h1="history -10"
alias h2="history -20"
alias h3="history -30"
alias hs="history | fzf --border --height 50% | copy"

alias copy="pbcopy"
alias paste="pbpaste"

alias a="alias | fzf --border --height 50% | rg -o '^[^=]+' | copy"
alias c="clear"

alias v="nvim"
alias ip="curl -s https://icanhazip.com; echo"

alias ls='eza --oneline --classify --color=automatic --icons --time-style=long-iso --group-directories-first'
alias la='ls --all'
alias ll='ls --all --long --header --binary --git'

alias lg="lazygit"
alias lzd="lazydocker"

alias uuid="uuidgen | tr '[:upper:]' '[:lower:]'"
alias uuidc="uuid | copy"

alias ff="rg --files -uu -g \"!.git\" | fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}' | xargs nvim"

alias so="source ${ZDOTDIR}/.zshrc"

alias path="echo ${PATH} | tr ':' '\n'"
alias spath="path | fzf --border --height 50% | copy"

alias ping="ping -c 5"

alias now='date +"%T"'

alias tf="terraform"

# 7. Tool init
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
command -v fnm >/dev/null 2>&1 && eval "$(fnm env --use-on-cd --shell zsh)"
command -v zoxide >/dev/null 2>&1 && eval "$(zoxide init zsh --cmd cd)"
command -v docker >/dev/null 2>&1 && eval "$(docker completion zsh)"
command -v op >/dev/null 2>&1 && eval "$(op completion zsh)"
command -v uv >/dev/null 2>&1 && eval "$(uv generate-shell-completion zsh)"
command -v uvx >/dev/null 2>&1 && eval "$(uvx --generate-shell-completion zsh)"
command -v fzf >/dev/null 2>&1 && source <(fzf --zsh)

# 8. Prompt
command -v starship >/dev/null 2>&1 && eval "$(starship init zsh)"

# 9. Local overrides
if [ -f "${ZDOTDIR}/local.zshrc" ]; then
    source "${ZDOTDIR}/local.zshrc"
fi
