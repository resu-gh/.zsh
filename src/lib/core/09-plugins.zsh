#!/usr/bin/env zsh

local -a _ZV_PLUGINS=(
    zsh-users/zsh-syntax-highlighting
    zsh-users/zsh-autosuggestions
    zsh-users/zsh-completions
    marlonrichert/zsh-autocomplete
)

zstyle ':autocomplete:*' min-input 1

for p ($_ZV_PLUGINS[@]) zcomet load $p

zcomet compinit
