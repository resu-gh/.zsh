#!/usr/bin/env zsh

local _ZV_CARGO_DIR="$HOME/.cargo"
local _ZV_CARGO_BIN="$_ZV_CARGO_DIR/bin"

[[ -d "$_ZV_CARGO_BIN" ]] && {
    path+=("$_ZV_CARGO_BIN")
    export PATH
}
