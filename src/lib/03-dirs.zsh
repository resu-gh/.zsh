#!/bin/zsh

setopt AUTO_CD

# auto ls after cd
chpwd() {
    emulate -L zsh
    exa -as type
}
