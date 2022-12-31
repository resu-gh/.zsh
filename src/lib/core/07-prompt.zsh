#!/usr/bin/env zsh

local lcms=(
    "%F{245}%1~%f"
    "%F{245}#%f"
    ""
)
PROMPT="${(j: :)lcms}"

local rcms=()
RPROMPT="${(j: :)rcms}"

setopt TRANSIENT_RPROMPT
