set dotenv-load := true
set dotenv-required := true
target := "$HOME"
common-dir := "common"
machine-dir := "$DOTFILE_MACHINE_DIR"
local_dir := "local"

apply: (_stow common-dir) (_stow machine-dir) (_stow local_dir)
clean: (_unstow common-dir) (_unstow machine-dir) (_unstow local_dir)

_stow dir:
  @stow {{dir}} --dotfiles --target {{target}} --verbose --no-folding

_unstow dir:
  @stow --delete {{dir}} --dotfiles --target {{target}} --verbose
