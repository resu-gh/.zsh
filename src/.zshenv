#!/usr/bin/env zsh

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_BIN_HOME="${XDG_BIN_HOME:-$HOME/.local/bin}"
export XDG_LIB_HOME="${XDG_LIB_HOME:-$HOME/.local/lib}"
export XDG_TMP_HOME="${XDG_TMP_HOME:-$HOME/.local/tmp}"

export ZCACHEDIR="$XDG_CACHE_HOME/zsh"
export ZDATADIR="$XDG_DATA_HOME/zsh"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
