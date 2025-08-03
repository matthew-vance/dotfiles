#!/usr/bin/env zsh

typeset -gU path fpath

export -U PATH path FPATH fpath MANPATH manpath
export -UT INFOPATH infopath

path=(
    $path
    $HOME/.local/bin
)

fpath=(
    $ZDOTDIR/functions
    $fpath
    $HOME/.local/share/zsh/site-functions
)

# Added by Toolbox App
export PATH="$PATH:$HOME/Library/Application Support/JetBrains/Toolbox/scripts"

# Add .NET Core SDK tools
export PATH="$PATH:$HOME/.dotnet/tools"
