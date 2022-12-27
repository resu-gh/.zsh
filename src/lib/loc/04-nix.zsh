#!/bin/zsh

local nixdir="$HOME/.nix-profile"
local nixhs="$nixdir/etc/profile.d/nix.sh"

[ -f $nixhs ] && . $nixhs
