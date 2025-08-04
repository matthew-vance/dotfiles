# dotfiles

`stow` is used to manage the symlinks. It is available in most package managers.
This whole thing basically works by mirroring the layout of the home directory and symlinking all of the files.

## Requirements

- `stow` - symlink manager
- `git` - version control
- `brew` - package manager
- `fzf` - fuzzy finder
- `ripgrep` - faster `grep` alternative
- `bat` - `cat` alternative with syntax highlighting
- `eza` - fast `ls` alternative
- `zoxide` - smart `cd` alternative
- `git-delta` - `git` diff viewer
- `starship` - shell prompt
- `just` - command runner

## Optional

- `fnm` if using node
- `pyenv` if using python
- `rbenv` if using ruby
- `lazygit`
- `lazydocker`

## Usage

Clone the repo anywhere.

```sh
git clone git@github.com:matthew-vance/dotfiles.git && cd ./dotfiles
```

Run `bootstrap.sh` to do basic setup.

```sh
./bootstrap.sh
```

Init the submodule for the desired machine.

```sh
git submodule update --init machine-dir
```

Run `just` to apply the config.

```sh
just
```

See the [justfile](justfile) for full list of available commands.

By default Stow will symlink the contents of the `stow` directory to `$HOME`, so the directory structure should mirror the structure you want in that directory.

## zsh

### Local config

Some tools support local configuration files that are not checked into the repository. For example, `zsh` supports a `local.zsh` file that can be used to add local shell config. These files can be added to the `local` directory and they will be symlinked just like the common and machine-specific files.

### Plugin management

Plugins are managed with [Antidote](https://getantidote.github.io/). The `antidote` command is available in the shell.

To update plugins and the plugin manager, run:

```sh
antidote update
```

## fonts

[JetBrains Mono](https://www.jetbrains.com/lp/mono/) is the primary font. You need the vanilla version and [the nerd font version](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono).
