#!/bin/zsh

ZCOMETDIR="$ZDATADIR/.zcomet"

local zcomet_repo="https://github.com/agkozak/zcomet.git"
local zcomet_home="$ZCOMETDIR/bin"
local zcomet="$zcomet_home/zcomet.zsh"

[[ ! -f $zcomet ]] && git clone $zcomet_repo $zcomet_home

. $zcomet

zstyle ':zcomet:*' home-dir "$ZCOMETDIR"
zstyle ':zcomet:compinit' dump-file "$ZCACHEDIR/.zcomet"
