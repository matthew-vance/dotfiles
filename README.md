# dotfiles

Personal macOS dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Bootstrap

On a fresh Mac, run:

```sh
./bootstrap.sh
```

This installs Homebrew, zsh, stow, and just, then stows the zsh config.

## Install packages

After bootstrapping, install everything from the Brewfile:

```sh
brew bundle
```

## Stow packages

Each directory is a stow package. Link configs for the tools you have installed:

```sh
just stow git
just stow ssh
just stow starship
just stow ghostty
just stow lazygit
```

To unlink a package:

```sh
just unstow <package>
```

## Packages

| Package    | Contents                                  |
|------------|-------------------------------------------|
| `zsh`      | `.zshenv`, `.zshrc`, plugins, local hooks |
| `git`      | `.gitconfig`, global ignore               |
| `ssh`      | `.ssh/config`                             |
| `starship` | `starship.toml`                           |
| `ghostty`  | Ghostty terminal config                   |
| `lazygit`  | lazygit config with delta and Catppuccin  |

## Local overrides

Machine-specific config lives outside the repo and is gitignored:

- `~/.config/zsh/local.zshrc` — shell aliases, env vars, secrets
- `~/.config/git/config.local` — user name, email, signing key
