# dotfiles

`stow` is used to manage the symlinks. It can be installed with Homebrew or with the `bootstrap.sh` script.
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

See the [justfile](justfile) for the full list of available commands.

By default Stow will symlink the contents of the `stow` directory to `$HOME`, so the directory structure should mirror the structure you want in that directory.

## zsh

### Local config

Shell files can be placed in `local/` to be sourced automatically.

### Plugin management

Plugins are managed with [Antidote](https://getantidote.github.io/). The `antidote` command is available in the shell.

To update plugins and the plugin manager, run:

```sh
antidote update
```

## neovim

### Language Configuration Architecture

The Neovim configuration uses a hybrid approach for managing language-specific settings (LSP, treesitter, formatters):

**Philosophy:**
- **Complex languages** get individual configuration files in `lua/lang/`
- **Simple languages** remain in centralized base configurations
- **Modular when it matters** - separate files only when there are specific settings, multiple related tools, or configuration complexity

**When to create individual language files:**
- Language has custom LSP settings (like Lua's `telemetry = false`)
- Multiple related languages share tooling (TypeScript + JavaScript)
- Language requires specific configuration (Go's `gofumpt = true`)
- Language has unique formatter or parser requirements

**When to leave in base configs:**
- LSP server has empty configuration `{}`
- Formatter is a simple one-liner assignment
- Treesitter parser requires no special setup

### Adding a New Language Configuration

To add a new language-specific configuration:

1. **Create the language file** at `lua/lang/{language}.lua`:

```lua
return {
  -- LSP server configurations (keys are server names to install)
  lsp = {
    server_name = {
      settings = {
        -- LSP-specific settings
      },
    },
  },

  -- Treesitter parsers
  treesitter = {
    "parser1",
    "parser2",
  },

  -- Formatters by filetype
  formatters = {
    filetype = { "formatter_name" },
  },
}
```

2. **Remove from base configs** (only if the language was previously configured there) - Remove the language's LSP servers, parsers, and formatters from:
   - `lua/plugins/lsp.lua` (base_servers arrays)
   - `lua/plugins/treesitter.lua` (base_parsers array)
   - `lua/plugins/conform.lua` (base_formatters table)

3. **Run symlink command** to apply changes:
```sh
just
```

The system automatically discovers and loads all `.lua` files in the `lua/lang/` directory (except `init.lua`).

## fonts

[JetBrains Mono](https://www.jetbrains.com/lp/mono/) is the primary font. You need the vanilla version and [the nerd font version](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono).
