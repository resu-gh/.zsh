#!/usr/bin/env zsh

# Profiling
[[ ${_ZB_PERF:-0} -eq 0 ]] || zmodload zsh/zprof

alias bench="_ZB_PERF=1 zsh"

# Functions
_ZF_HAS() {
    for c ($@) [[ -z "$(command -v $c)" ]] && return 1
    return 0
}

# Directories
_ZV_LIB_DIR="$ZDOTDIR/lib"
_ZV_LIB_CORE_DIR="$_ZV_LIB_DIR/core"
_ZV_LIB_SYS_DIR="$_ZV_LIB_DIR/sys"
_ZV_LIB_LOC_DIR="$_ZV_LIB_DIR/loc"

# Scripts
_ZV_LIB_SRC=(
    $_ZV_LIB_CORE_DIR/<->-*.zsh(N)
    $_ZV_LIB_SYS_DIR/<->-*.zsh(N)
    $_ZV_LIB_LOC_DIR/<->-*.zsh(N)
)

# Source
() { for s ($_ZV_LIB_SRC[@]) source $s }

# Compinit
function _ZF_REFRESH_COMPINIT() {
    emulate -L zsh
    setopt LOCAL_OPTIONS EXTENDED_GLOB

    ZSH_COMPDUMP="${ZSH_COMPDUMP:-$ZCACHEDIR/zcompdump}"
    [[ -d "$ZSH_COMPDUMP:h" ]] || mkdir -p "$ZSH_COMPDUMP:h"
    autoload -Uz compinit

    if [[ "$1" != "-f" ]] && [[ $ZSH_COMPDUMP(#qNmh-20) ]]; then
        compinit -C -d "$ZSH_COMPDUMP"
    else
        compinit -i -d "$ZSH_COMPDUMP"
        touch "$ZSH_COMPDUMP"
    fi

    () {
        if [[ -s "$ZSH_COMPDUMP" && (! -s "${ZSH_COMPDUMP}.zwc" || "$ZSH_COMPDUMP" -nt "${ZSH_COMPDUMP}.zwc") ]]; then
            zcompile "$ZSH_COMPDUMP"
        fi
    } &!
}

[[ ${_ZB_DEFER_COMPINIT:-false} = true ]] || _ZF_REFRESH_COMPINIT

# Profiling
[[ ${_ZB_PERF:-0} -eq 0 ]] || {
    unset _ZB_PERF
    zprof
}
