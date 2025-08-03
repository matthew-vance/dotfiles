#!/usr/bin/env zsh

if command -v op &>/dev/null; then
    eval "$(op completion zsh)"
fi

# ssh agent
if [[ -f "$HOME/.agent-bridge.sh" ]]; then
    source "$HOME/.agent-bridge.sh"
fi
