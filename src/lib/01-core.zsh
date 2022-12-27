#!/bin/zsh

zhas() {
    for c in "$@"; do
        [[ -z "$(command -v $c)" ]] && return 1
    done
    return 0
}

zuse() {
    [[ -f "$1" ]] && . "$1"
}

# autoload -Uz compinit
# compinit
# # auto-completion with keyboard
# zstyle ':completion:*' menu select
# zmodload zsh/complist
# _comp_options+=(globdots)
# # enable auto-completion in privileged commands
# zstyle ':completion::complete:*' gain-privileges 1
# # case insensitive completion
# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# # generate descriptions with magic
# zstyle ':completion:*' auto-description 'specify: %d'
# # improve completion style appearance
# zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
# zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
# # persistent rehash
# zstyle ':completion:*' rehash true
# #completion cache
# zstyle ':completion:*' use-cache on
# zstyle ':completion:*' cache-path $HOME/.config/zsh/cache
# # prevent cvs files/directories from being completed
# zstyle ':completion:*:(all-|)files' ignored-patterns '(|*/)CVS'
# zstyle ':completion:*:cd:*' ignored-patterns '(*/)#CVS'
# # fuzzy matching of completion on mistype
# zstyle ':completion:*' completer _complete _match _approximate
# zstyle ':completion:*:match:*' original only
# zstyle ':completion:*:approximate:*' max-errors 1 numeric
# # the number of errors allowed by _approximate increase with the length of what you have typed so far
# zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'
# # ignore completion functions for commands you don't have
# zstyle ':completion:*:functions' ignored-patterns '_*'
# # fall into menu selection immediately and have the  words sorted by time
# function xdvi() { command xdvi ${*:-*.dvi(om[1])} }
# zstyle ':completion:*:*:xdvi:*' menu yes select
# zstyle ':completion:*:*:xdvi:*' file-sort time
# # completing process ids with menu selection
# zstyle ':completion:*:*:kill:*' menu yes select
# zstyle ':completion:*:kill:*'   force-list always
# # remove the trailing slash if you end up using a directory as argument (usefull with ln)
# zstyle ':completion:*' squeeze-slashes true
# # cd will never select the parent directory
# zstyle ':completion:*:cd:*' ignore-parents parent pwd

# () {
#     emulate -L zsh
#     autoload -Uz compinit
#     zstyle ':completion:*' use-cache true
#     zstyle ':completion:*' cache-path $ZCACHEDIR
#     compinit -C -d $ZCACHEDIR
# }
