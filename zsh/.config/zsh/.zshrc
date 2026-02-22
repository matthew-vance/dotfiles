# 1. Environment
export HISTFILE=${XDG_DATA_HOME}/zsh/history
export HISTSIZE=50000
export SAVEHIST=50000
export ANTIDOTE_DIR=${HOME}/.antidote
export ZSH_CACHE_DIR=${XDG_CACHE_HOME}/zsh

export PATH=${PATH}:${HOME}/.local/bin
export PATH=${HOME}/go/bin:${PATH}

# 2. Options

# History options
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
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

# 3. Plugins
if [[ ! -d $ANTIDOTE_DIR ]]; then
  git clone https://github.com/mattmc3/antidote $ANTIDOTE_DIR
fi

source ${ANTIDOTE_DIR}/antidote.zsh
antidote load

# 4. Completion
autoload -Uz compinit
compinit -d "$ZSH_CACHE_DIR/zcompdump"

# 5. Keybindings
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# 6. Functions
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
  brew doctor >/dev/null 2>&1 || true
}

# 7. Aliases
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
alias ll='ls --all --long --header --binary'
alias sl="ls"

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

# 8. Tool init
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
command -v fnm >/dev/null 2>&1 && eval "$(fnm env --use-on-cd --shell zsh)"
command -v zoxide >/dev/null 2>&1 && eval "$(zoxide init zsh --cmd cd)"
command -v docker >/dev/null 2>&1 && eval "$(docker completion zsh)"
command -v op >/dev/null 2>&1 && eval "$(op completion zsh)"
command -v uv >/dev/null 2>&1 && eval "$(uv generate-shell-completion zsh)"
command -v uvx >/dev/null 2>&1 && eval "$(uvx --generate-shell-completion zsh)"

# 9. Prompt
command -v starship >/dev/null 2>&1 && eval "$(starship init zsh)"

# 10. Local overrides
if [ -f "${ZDOTDIR}/local.zshrc" ]; then
    source "${ZDOTDIR}/local.zshrc"
fi