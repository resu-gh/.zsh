#!/bin/zsh

zmodload zsh/terminfo
typeset -gA keys
keys=(
    'F1'               "$terminfo[kf1]"
    'F2'               "$terminfo[kf2]"
    'F3'               "$terminfo[kf3]"
    'F4'               "$terminfo[kf4]"
    'F5'               "$terminfo[kf5]"
    'F6'               "$terminfo[kf6]"
    'F7'               "$terminfo[kf7]"
    'F8'               "$terminfo[kf8]"
    'F9'               "$terminfo[kf9]"
    'F10'              "$terminfo[kf10]"
    'F11'              "$terminfo[kf11]"
    'F12'              "$terminfo[kf12]"
    'PageUp'           "$terminfo[kpp]"
    'PageDown'         "$terminfo[knp]"
    'Up'               "$terminfo[kcuu1]"
    'Down'             "$terminfo[kcud1]"
    'Left'             "$terminfo[kcub1]"
    'Right'            "$terminfo[kcuf1]"
    'ShiftTab'         "$terminfo[kcbt]"
    'Home'             "$terminfo[khome]"
    'End'              "$terminfo[kend]"
    'Insert'           "$terminfo[kich1]"
    'Delete'           "$terminfo[kdch1]"
    'Backspace'        "$terminfo[kbs]"
    'Control-Left'     "$terminfo[kLFT5]"
    'Control-Right'    "$terminfo[kRIT5]"
)

# bindkey "${keys[Home]}" beginning-of-line
# bindkey "${keys[End]}" end-of-line
# bindkey "${keys[Insert]}" overwrite-mode
# bindkey "${keys[Backspace]}" backward-delete-char
# bindkey "${keys[Delete]}" delete-char
# bindkey "${keys[Up]}" up-line-or-history
# bindkey "${keys[Down]}" down-line-or-history
# bindkey "${keys[Left]}" backward-char
# bindkey "${keys[Right]}" forward-char
# bindkey "${keys[PageUp]}" beginning-of-buffer-or-history
# bindkey "${keys[PageDown]}" end-of-buffer-or-history
# bindkey "${keys[ShiftTab]}" reverse-menu-complete

# # enable reverse search
# bindkey '^A' history-incremental-search-backward

# # vim mode
# bindkey -v
# KEYTIMEOUT=1

# # vim cursor emulation
# zle-keymap-select() {
#     if [[ ${KEYMAP} = vicmd ]] || [[ $1 == 'block' ]]; then
#         echo -ne '\e[1 q'
#     elif [[ ${KEYMAP} = main ]] || [[ ${KEYMAP} = viins ]] ||
#          [[ ${KEYMAP} = '' ]] || [[ $1 == 'beam' ]]; then
#         echo -ne '\e[5 q'
#     fi
# }
# zle -N zle-keymap-select
# _fix_cursor() { echo -ne '\e[5 q' }
# precmd_functions+=(_fix_cursor)

# [[ -n "${key[Home]}" ]] && bindkey -- "${key[Home]}" beginning-of-line
# [[ -n "${key[End]}" ]] && bindkey -- "${key[End]}" end-of-line
# [[ -n "${key[Insert]}" ]] && bindkey -- "${key[Insert]}" overwrite-mode
# [[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}" backward-delete-char
# [[ -n "${key[Delete]}" ]] && bindkey -- "${key[Delete]}" delete-char
# [[ -n "${key[Up]}" ]] && bindkey -- "${key[Up]}" up-line-or-history
# [[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-history
# [[ -n "${key[Left]}" ]] && bindkey -- "${key[Left]}" backward-char
# [[ -n "${key[Right]}" ]] && bindkey -- "${key[Right]}" forward-char
# [[ -n "${key[PageUp]}" ]] && bindkey -- "${key[PageUp]}" beginning-of-buffer-or-history
# [[ -n "${key[PageDown]}" ]] && bindkey -- "${key[PageDown]}" end-of-buffer-or-history
# [[ -n "${key[ShiftTab]}" ]] && bindkey -- "${key[ShiftTab]}" reverse-menu-complete

# # make sure the terminal is in application mode, when zle is active
# if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
#     autoload -Uz add-zle-hook-widget
#     function zle_application_mode_start { echoti smkx }
#     function zle_application_mode_stop { echoti rmkx }
#     add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
#     add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
# fi

# # matching-driven history search
# autoload -Uz up-line-or-beginning-search
# zle -N up-line-or-beginning-search
# [[ -n "${key[Up]}" ]] && bindkey -- "${key[Up]}" up-line-or-beginning-search
# autoload -Uz down-line-or-beginning-search
# zle -N down-line-or-beginning-search
# [[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search
# [[ -n "${key[Control-Left]}" ]] && bindkey -- "${key[Control-Left]}" backward-word
# [[ -n "${key[Control-Right]}" ]] && bindkey -- "${key[Control-Right]}" forward-word

# # Use vim keys in tab complete menu
# bindkey -M menuselect 'h' vi-backward-char
# bindkey -M menuselect 'k' vi-up-line-or-history
# bindkey -M menuselect 'l' vi-forward-char
# bindkey -M menuselect 'j' vi-down-line-or-history

# delete char using delete key
# bindkey -v '^?' backward-delete-char
