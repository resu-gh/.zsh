#!/usr/bin/env zsh

export -U PATH path FPATH fpath MANPATH manpath
export -UT INFOPATH infopath

_ZF_HAS "alacritty" && {
    export TERMINAL="alacritty"
}

_ZF_HAS "st" && [[ -z $TERMINAL ]] && {
    export TERMINAL="st"
}

_ZF_HAS "nvim" && {
    export VISUAL="nvim"
    export EDITOR="nvim"
}

_ZF_HAS "bat" && {
    export PAGER="bat"
    export MANPAGER="sh -c 'col -bx | bat -l man -p'"
    export BAT_STYLE="plain"
}

_ZF_HAS "less" && {
    export LESS=${LESS:-'-g -i -M -R -S -w -z-4'}
    export LESSHISTFILE="-"
}

_ZF_HAS "nnn" && {
    export NNN_OPTS="cedH"
    export NNN_BMS="h:~;c:~/.config;r:/;u:/usr;e:/etc;l:~/.local;"
    export NNN_PLUG="o:fzopen;p:preview-tabbed"
    export NNN_COLORS="1234"
    export NNN_TMPFILE="$XDG_CONFIG_HOME/nnn/.lastd"
    export NNN_FIFO="/tmp/nnn.fifo"
}

_ZF_HAS "go" && {
    export GOPATH="$HOME/.go"
    path+=("$GOPATH/bin")
}

path+=("$XDG_BIN_HOME")
export PATH
