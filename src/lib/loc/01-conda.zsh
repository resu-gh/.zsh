#!/bin/zsh

local condadir="$HOME/.miniconda3"
local condash="$condadir/etc/profile.d/conda.sh"

[ -f $condash ] && . $condash
