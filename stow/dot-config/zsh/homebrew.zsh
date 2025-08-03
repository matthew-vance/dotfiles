#!/usr/bin/env zsh

# https://brew.sh

eval "$(/opt/homebrew/bin/brew shellenv)"
alias bupa="brew update && brew upgrade && brew cleanup && brew doctor"
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
