[working-directory: "stow"]
stow target="$HOME":
  @stow . --dotfiles --target {{target}} --verbose

[working-directory: "stow"]
unstow target="$HOME":
  @stow --delete . --dotfiles --target {{target}} --verbose
