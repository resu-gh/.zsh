#!/bin/zsh

HISTFILE="$ZDOTDIR/.hist/.main"

[[ -d $HISTFILE:h ]] || mkdir -p $HISTFILE:h

SAVEHIST=$(( 100 * 1000 ))

HISTSIZE=$(( 1.2 * SAVEHIST ))

setopt HIST_FCNTL_LOCK
setopt HIST_IGNORE_ALL_DUPS
setopt SHARE_HISTORY
