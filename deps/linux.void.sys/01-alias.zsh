#!/usr/bin/env zsh

_ZF_HAS "xbps-query" "xbps-install" "xbps-remove" "sed" "cut" "fzf" "xargs" "vpm" && {
    xinstall() {
        xbps-query -Rs '' |
        sed -e '/\[\*\]/d' |
        cut -d' ' -f2 |
        fzf -m --preview 'xbps-query -R {1}' |
        cut -d' ' -f2 |
        xargs -ro sudo xbps-install -Sy
    }
    alias xi="xinstall"

    xremove() {
        xbps-query -Rl |
        cut -d' ' -f2 |
        fzf -m --preview 'xbps-query -R {1}' |
        xargs -ro sudo xbps-remove -y
    }
    alias xp="xremove"

    xupdate() {
        xbps-install -un |
        cut -d' ' -f1 |
        fzf -m --bind "ctrl-a:select-all" --preview 'xbps-query -R {1}' |
        cut -d' ' -f2 |
        xargs -ro sudo xbps-install -y
    }
    alias xu="sudo vpm sync; xupdate"

    xrremove() {
        xbps-query -Rl |
        cut -d' ' -f2 |
        fzf -m --preview 'xbps-query -R {1}' |
        xargs -ro sudo xbps-remove -R
    }
    alias xpp="xrremove"
}

_ZF_HAS "vpm" "vkpurge" "sudo" && {
    gupdate() {
        sudo vpm up
        sudo vpm cl
        sudo vpm ar
        sudo vkpurge list
        sudo vkpurge rm all
    }
    alias gu="gupdate"
}
