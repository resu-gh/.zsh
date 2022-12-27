#!/bin/zsh

privkeys=(
    "$HOME/.ssh/resu-gh"
)

[[ -z "$SSH_AUTH_SOCK" ]] && {
    eval `ssh-agent -s`
    for i ("$privkeys[@]") ssh-add $i
}
