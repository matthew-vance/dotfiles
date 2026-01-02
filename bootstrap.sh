#!/usr/bin/env bash

set -euo pipefail

if [[ "$OSTYPE" != "darwin"* ]]; then
    echo "This script only supports macOS"
    exit 1
fi

if ! command -v brew &> /dev/null; then
    echo "Homebrew not found. Installing Homebrew..."
    sudo -v
    export NONINTERACTIVE=1
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew is already installed."
fi

eval "$(/opt/homebrew/bin/brew shellenv)"

# Install zsh via Homebrew
if ! brew list zsh &> /dev/null; then
    echo "Installing zsh via Homebrew..."
    brew install zsh
else
    echo "zsh is already installed via Homebrew."
fi

# Change the default shell to the Homebrew-installed zsh if it's not already set
BREW_ZSH_PATH="/opt/homebrew/bin/zsh"
if [[ "$SHELL" != "$BREW_ZSH_PATH" ]]; then
    echo "Changing default shell to Homebrew-installed zsh..."
    if ! grep -q "$BREW_ZSH_PATH" /etc/shells; then
        echo "$BREW_ZSH_PATH" | sudo tee -a /etc/shells
    fi
    chsh -s "$BREW_ZSH_PATH"
else
    echo "Default shell is already set to Homebrew-installed zsh."
fi

# Install stow via Homebrew
if ! brew list stow &> /dev/null; then
    echo "Installing stow..."
    brew install stow
else
    echo "stow is already installed."
fi

# Install just via Homebrew
if ! brew list just &> /dev/null; then
    echo "Installing just..."
    brew install just
else
    echo "just is already installed."
fi

echo "Bootstrap completed successfully."
