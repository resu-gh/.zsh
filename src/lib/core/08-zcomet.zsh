#!/bin/zsh

local _ZV_ZCOMET_DIR="$ZDATADIR/.zcomet"
local _ZV_ZCOMET_REPO="https://github.com/agkozak/zcomet.git"
local _ZV_ZCOMET_HOME="$_ZV_ZCOMET_DIR/bin"
local _ZV_ZCOMET_SRC="$_ZV_ZCOMET_HOME/zcomet.zsh"

[[ ! -f "$_ZV_ZCOMET_SRC" ]] && git clone $_ZV_ZCOMET_REPO $_ZV_ZCOMET_HOME

. $_ZV_ZCOMET_SRC

zstyle ':zcomet:*' home-dir "$_ZV_ZCOMET_DIR"
zstyle ':zcomet:compinit' dump-file "$ZCACHEDIR/.zcomet"
