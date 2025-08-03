#!/usr/bin/env zsh

alias -g ...="../.."
alias -g ....="../../.."
alias -g .....="../../../.."
alias -g ......="../../../../.."

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

alias vim="nvim"

alias ip="curl -s https://icanhazip.com; echo"

alias ls='eza --color=auto'
alias la='ls --all'
alias ll='ls --all --long --header --classify=auto'
alias sl="ls"

alias lg="lazygit"
alias lzd="lazydocker"

alias uuid="uuidgen | tr '[:upper:]' '[:lower:]'"
alias uuidc="uuid | copy"

alias ff="rg --files -uu -g \"!.git\" | fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}' | xargs nvim"

alias so="source ${ZDOTDIR}/.zshrc"

alias path="echo \"${PATH}\" | tr ':' '\n'"
alias spath="path | fzf --border --height 50% | copy"

alias ping="ping -c 5"

alias now='date +"%T"'

alias tf="terraform"
alias k="kubectl"

alias love="/Applications/love.app/Contents/MacOS/love"

[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"

# What's running on this port?
rop() {
    lsof -i -P | rg LISTEN | rg :$1
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
