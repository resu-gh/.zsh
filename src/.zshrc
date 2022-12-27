#!/bin/zsh

() {
    local script=
    for script in $ZDOTDIR/lib/<->-*.zsh(n); do
        . $script
    done

    local script=
    for script in $ZDOTDIR/lib/sys/<->-*.zsh(n); do
        . $script
    done

    local script=
    for script in $ZDOTDIR/lib/loc/<->-*.zsh(n); do
        . $script
    done
} "$@"
