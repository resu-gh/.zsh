#!/bin/zsh

export -U PATH path FPATH fpath MANPATH manpath
export -UT INFOPATH infopath

zhas "st" && export TERMINAL="st"
zhas "alacritty" && [[ -z "$TERMINAL" ]] && export TERMINAL="alacritty"

zhas "nvim" && {
    export VISUAL="nvim"
    export EDITOR="nvim"
}

zhas "bat" && export PAGER="bat --paging=always -p"

zhas "less" && export LESSHISTFILE="-"

zhas "nnn" && {
    export NNN_OPTS="cedH"
    export NNN_BMS="h:~;c:~/.config;r:/;u:/usr;e:/etc;l:~/.local;"
    export NNN_PLUG="o:fzopen;p:preview-tabbed"
    export NNN_COLORS="1234"
    export NNN_TMPFILE="$XDG_CONFIG_HOME/nnn/.lastd"
    export NNN_FIFO="/tmp/nnn.fifo"
}

zhas "go" && {
    export GOPATH="$HOME/.go"
    path+=("$GOPATH/bin")
}

path+=("$HOME/.local/bin")
export PATH
