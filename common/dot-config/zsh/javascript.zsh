#!/usr/bin/env zsh

# https://fnm.vercel.app/

if command -v fnm &> /dev/null; then
  alias nvm="echo 'use fnm ya big, dumb, idiot'"
  export PATH="$HOME/Library/Application Support/fnm:$PATH"
  eval "$(fnm env --use-on-cd)"
fi

export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# bun
export PATH="$HOME/.bun/bin:$PATH"
[ -s $HOME/.bun/_bun ] && source $HOME/.bun/_bun
