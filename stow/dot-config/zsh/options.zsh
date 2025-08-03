#!/usr/bin/env zsh

# Changing Directories
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_MINUS

# Completion
setopt ALWAYS_TO_END
setopt AUTO_LIST
setopt AUTO_MENU
setopt AUTO_PARAM_SLASH
setopt COMPLETE_IN_WORD
setopt EXTENDED_GLOB
unsetopt FLOW_CONTROL
unsetopt MENU_COMPLETE

# Expansion and Globbing
setopt NUMERIC_GLOB_SORT

# Input/Output
setopt INTERACTIVE_COMMENTS
setopt HASH_EXECUTABLES_ONLY
