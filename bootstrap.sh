#! /usr/bin/env sh

set -o errexit
set -o nounset
set -o pipefail

script_dir=$(dirname "$0")
local_dir="$script_dir/local"
dotenv_file="$script_dir/.env"

ensure_cmd() {
  local cmd="$1"
  local brew_pkg="${2:-$cmd}"

  if ! command -v "$cmd" >/dev/null 2>&1; then
    echo "$cmd is not installed. Installing with Homebrew..."
    brew install "$brew_pkg"
  fi
  "$cmd" --version
}

main() {
  if ! command -v brew >/dev/null 2>&1; then
    echo "Homebrew is not installed. Install it from https://brew.sh/"
    exit 1
  fi
  brew --version

  ensure_cmd zsh
  ensure_cmd git
  ensure_cmd stow
  ensure_cmd just

  if ! grep -q "$(which zsh)" /etc/shells; then
    sudo sh -c "echo $(which zsh) >> /etc/shells"
  fi

  if [ "$SHELL" != "$(which zsh)" ]; then
    chsh -s "$(which zsh)"
  fi

  if [ ! -f "$dotenv_file" ]; then
    echo "Creating .env file from example.env..."
    cp "$script_dir/example.env" "$dotenv_file"
  fi

  if [ ! -d "$local_dir" ]; then
    echo "Creating local directory..."
    mkdir -p "$local_dir"
  fi

  echo "✅ Bootstrapping complete"
}

main
