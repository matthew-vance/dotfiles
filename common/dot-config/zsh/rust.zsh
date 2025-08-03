#!/usr/bin/env zsh

CARGO_ENV="$HOME/.cargo/env"

if [[ -f $CARGO_ENV ]]; then
  . $CARGO_ENV
fi
