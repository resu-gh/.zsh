#!/usr/bin/env zsh

_ZF_HAS "pacman" "comm" "fzf" "xargs" "sudo" && {
    xinstall() {
        comm -13 <(pacman -Qq | sort) <(pacman -Slq | sort) |
        fzf -m --preview 'pacman -Si {}' --reverse |
        xargs -ro sudo pacman -S --noconfirm
    }
    alias xi="xinstall"

    xremove() {
        pacman -Qqn |
        fzf -m --bind "ctrl-a:select-all" --preview 'pacman -Qil' --reverse |
        xargs -ro sudo pacman -R
    }
    alias xp="xremove"

    xupdate() {
        pacman -Qqn |
        fzf -m --bind "ctrl-a:select-all" --preview 'pacman -Qil' --reverse |
        xargs -ro sudo pacman -Syu --needed
    }
    alias xu="xupdate"

    xrremove() {
        pacman -Qqn |
        fzf -m --bind "ctrl-a:select-all" --preview 'pacman -Qil' --reverse |
        xargs -ro sudo pacman -Rs
    }
    alias xpp="xrremove"
}

_ZF_HAS "yay" "nix" "sudo" && {
    gupdate() {
        yay
        sudo nix-channel --update -v 
        nix-env --upgrade -v
        nix-collect-garbage --delete-old
        nix-store --optimize -v
    }
    alias gu="gupdate"
}
