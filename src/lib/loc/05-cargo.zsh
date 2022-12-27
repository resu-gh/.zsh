#!/bin/zsh

local cargodir="$HOME/.cargo"
local cargobin="$cargodir/bin"

[ -d $cargobin ] && {
    path+=("$cargobin")
    export PATH
}
