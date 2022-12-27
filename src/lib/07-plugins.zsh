#!/bin/zsh

local -a plugins=(
    marlonrichert/zsh-autocomplete
    zsh-users/zsh-syntax-highlighting
    zsh-users/zsh-autosuggestions
    zsh-users/zsh-completions
)

# zsh-autocomplete
# zstyle ':autocomplete:*' async no
zstyle ':autocomplete:*' min-input 1
zstyle ':autocomplete:*' min-delay 1
zstyle ':autocomplete:*' insert-unambiguous yes
zstyle ':autocomplete:*' widget-style menu-select
zstyle ':autocomplete:*' fzf-completion yes
bindkey '^S' history-incremental-search-forward
bindkey '^R' history-incremental-search-backward

local p=
for p in $plugins; do
    zcomet load $p
done

zcomet compinit
