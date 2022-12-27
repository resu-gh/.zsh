#!/bin/zsh

local lcms=(
    "%F{245}%1~%f"
    "%F{245}#%f"
    ""
)
local rcms=()

PROMPT=${(j: :)lcms}
RPROMPT=${(j: :)rcms}

setopt TRANSIENT_RPROMPT
