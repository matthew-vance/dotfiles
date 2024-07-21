#!/usr/bin/env zsh

HISTFILE=$HOME/.local/share/zsh/history

[[ -d $HISTFILE:h ]] ||
    mkdir -p $HISTFILE:h

SAVEHIST=$(( 100 * 1000 ))
HISTFILESIZE=$(( 1.2 * SAVEHIST ))
HISTSIZE=$(( 1.2 * SAVEHIST ))

setopt HIST_FCNTL_LOCK
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
setopt SHARE_HISTORY