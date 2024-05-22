#!/usr/bin/env zsh

if command -v fnm &> /dev/null; then
  alias nvm="echo 'use fnm ya big, dumb, idiot'"
  export PATH="$HOME/Library/Application Support/fnm:$PATH"
  eval "$(fnm env --use-on-cd)"
fi
