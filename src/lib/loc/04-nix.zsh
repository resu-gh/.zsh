#!/usr/bin/env zsh

local _ZV_NIX_DIR="$HOME/.nix-profile"
local _ZV_NIX_SH="$_ZV_NIX_DIR/etc/profile.d/nix.sh"

[[ -f "$_ZV_NIX_SH" ]] && . $_ZV_NIX_SH
