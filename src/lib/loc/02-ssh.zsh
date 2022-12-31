#!/usr/bin/env zsh

local _ZV_SSH_DIR="$HOME/.ssh"
local _ZV_SSH_PRIVKEYS=(
    "$_ZV_SSH_DIR/resu-gh"
)

[[ -z "$SSH_AUTH_SOCK" ]] && {
    eval `ssh-agent -s`
    for i ($_ZV_SSH_PRIVKEYS[@]) ssh-add $i
}
