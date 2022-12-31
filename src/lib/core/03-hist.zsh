#!/usr/bin/env zsh

HISTFILE="$ZDOTDIR/.hist/.main"
[[ -d "$HISTFILE:h" ]] || mkdir -p "$HISTFILE:h"

SAVEHIST=$(( 100 * 1000 ))
HISTSIZE=$(( 1.2 * SAVEHIST ))
