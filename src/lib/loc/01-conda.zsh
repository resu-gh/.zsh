#!/usr/bin/env zsh

local _ZV_CONDA_DIR="$HOME/.miniconda3"
local _ZV_CONDA_SH="$_ZV_CONDA_DIR/etc/profile.d/conda.sh"

[[ -f "$_ZV_CONDA_SH" ]] && . $_ZV_CONDA_SH
