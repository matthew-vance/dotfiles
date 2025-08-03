set dotenv-load := true
set dotenv-required := true
target := "$HOME"
common-dir := "common"
machine-dir := "$MACHINE_DIR"

apply: (_stow common-dir) (_stow machine-dir)
clean: (_unstow common-dir) (_unstow machine-dir)

_stow dir:
  @stow {{dir}} --dotfiles --target {{target}} --verbose

_unstow dir:
  @stow --delete {{dir}} --dotfiles --target {{target}} --verbose
