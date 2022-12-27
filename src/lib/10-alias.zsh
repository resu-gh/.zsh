#!/bin/zsh

zhas "wget" && alias wget="wget --no-hsts"

zhas "cd" && alias q="cd .."

zhas "fd" && alias fd="fd -H -c always"

zhas "exa" && {
    alias l="exa -as type"
    alias d="exa -aDT -L 1"
    alias v="exa -lahg -s type"
    alias t="exa -aT"
}

zhas "nvim" && {
    alias n="nvim"
    alias vim="nvim"
}

zhas "du" "awk" "fzf" "xargs" && {
    fzfed() {
        du -a . |
        awk '{print $2}' |
        fzf --layout=reverse --height 20% |
        xargs -or $EDITOR ;
    }
    alias f="fzfed"
}


zhas "lazygit" && alias lg="lazygit"

zhas "docker" && alias dk="docker"

zhas "lazydocker" && alias ldk="lazydocker"

zhas "nnn" "echo" "rm" && {
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

zhas "st" "zsh" "cd" "exec" && {
    alias a='(&>/dev/null st -e zsh -c "cd $PWD; exec zsh" &)'
}

zhas "clear" && alias cs="clear"

zhas "shutdown" && {
    alias shd="sudo shutdown -P now"
    alias rbt="sudo shutdown -r now"
}

zhas "df" && alias df="df -h"

zhas "free" && alias free="free -h"

zhas "cp" && alias cp="cp -iv"

zhas "mv" && alias mv="mv -iv" 

zhas "rm" && alias rm="rm -vI"

zhas "mkdir" && alias mkd="mkdir -pv"

zhas "ls" && alias ls="ls -hN --color=auto --group-directories-first"

zhas "grep" && alias grep="grep --color=auto"

zhas "grep" "ip" && {
    alias ipv4="ip route get 8.8.8.8 2>/dev/null|grep -Eo 'src [0-9.]+'|grep -Eo '[0-9.]+'"
}

zhas "diff" && alias diff="diff --color=auto"

zhas "make" && alias mk="make"

zhas "jump" "cd" && {
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
