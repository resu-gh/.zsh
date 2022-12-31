#!/usr/bin/env zsh

_ZF_HAS "git" && alias g="git"

_ZF_HAS "wget" && alias wget="wget --no-hsts"

_ZF_HAS "cd" && alias q="cd .."

_ZF_HAS "fd" && alias fd="fd -H -c always"

_ZF_HAS "exa" && {
    alias l="exa -as type"
    alias d="exa -aDT -L 1"
    alias v="exa -lahg -s type"
    alias t="exa -aT"
}

_ZF_HAS "cd" "exa" && {
    chpwd() {
        emulate -L zsh
        exa -as type
    }
}

_ZF_HAS "nvim" && {
    alias n="nvim"
    alias vim="nvim"
}

_ZF_HAS "du" "awk" "fzf" "xargs" && {
    fzfed() {
        du -a . |
        awk "{print $2}" |
        fzf --layout=reverse --height 20% |
        xargs -or $EDITOR ;
    }
    alias f="fzfed"
}


_ZF_HAS "lazygit" && alias lg="lazygit"

_ZF_HAS "docker" && alias dk="docker"

_ZF_HAS "lazydocker" && alias ldk="lazydocker"

_ZF_HAS "nnn" "echo" "rm" && {
    nnncd() {
        if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
            echo "nnn is already running"
            return
        fi
        nnn "$@"
        if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
        fi
    }
    alias c="nnncd"
}

_ZF_HAS "st" "zsh" "cd" "exec" && {
    alias a="(&>/dev/null st -e zsh -c 'cd $PWD; exec zsh' &)"
}

_ZF_HAS "clear" && alias cs="clear"

_ZF_HAS "shutdown" && {
    alias shd="sudo shutdown -P now"
    alias rbt="sudo shutdown -r now"
}

_ZF_HAS "df" && alias df="df -h"

_ZF_HAS "free" && alias free="free -h"

_ZF_HAS "cp" && alias cp="cp -iv"

_ZF_HAS "mv" && alias mv="mv -iv" 

_ZF_HAS "rm" && alias rm="rm -vI"

_ZF_HAS "mkdir" && alias mkd="mkdir -pv"

_ZF_HAS "ls" && alias ls="ls -hN --color=auto --group-directories-first"

_ZF_HAS "grep" && alias grep="grep --color=auto"

_ZF_HAS "grep" "ip" && {
    alias ipv4="ip route get 8.8.8.8 2>/dev/null|grep -Eo 'src [0-9.]+'|grep -Eo '[0-9.]+'"
}

_ZF_HAS "diff" && alias diff="diff --color=auto"

_ZF_HAS "make" && alias mk="make"

_ZF_HAS "jump" "cd" && {
    __jump_chpwd() {
        jump chdir
    }
    jump_completion() {
        reply=(${(f)"$(jump hint $@)"})
    }
    j() {
        local dir="$(jump cd $@)"
        test -d "$dir" && cd "$dir"
    }
    typeset -gaU chpwd_functions
    chpwd_functions+=__jump_chpwd
    compctl -U -K jump_completion j
}
