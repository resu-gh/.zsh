#!/usr/bin/env zsh

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

() {
    # Make sure that the terminal is in application mode when zle is active,
    # since only then values from $terminfo are valid
    if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
        function zle-line-init() { echoti smkx }
        function zle-line-finish() { echoti rmkx }
        zle -N zle-line-init
        zle -N zle-line-finish
    fi

    # Use emacs key bindings
    bindkey -v
    KEYTIMEOUT=0

    # Up a line of history (PageUp)
    if [[ -n "${keys[PageUp]}" ]]; then
        bindkey -M emacs "${keys[PageUp]}" up-line-or-history
        bindkey -M viins "${keys[PageUp]}" up-line-or-history
        bindkey -M vicmd "${keys[PageUp]}" up-line-or-history
    fi
    # Down a line of history (PageDown)
    if [[ -n "${keys[PageDown]}" ]]; then
        bindkey -M emacs "${keys[PageDown]}" down-line-or-history
        bindkey -M viins "${keys[PageDown]}" down-line-or-history
        bindkey -M vicmd "${keys[PageDown]}" down-line-or-history
    fi

    # Fuzzy find history backward (Start typing + Up-Arrow)
    if [[ -n "${keys[Up]}" ]]; then
        autoload -U down-line-or-beginning-search
        zle -N down-line-or-beginning-search

        bindkey -M emacs "${keys[Up]}" down-line-or-beginning-search
        bindkey -M viins "${keys[Up]}" down-line-or-beginning-search
        bindkey -M vicmd "${keys[Up]}" down-line-or-beginning-search
    fi
    # Fuzzy find history forward (Start typing + Down-Arrow)
    if [[ -n "${keys[Down]}" ]]; then
        autoload -U up-line-or-beginning-search
        zle -N up-line-or-beginning-search

        bindkey -M emacs "${keys[Down]}" up-line-or-beginning-search
        bindkey -M viins "${keys[Down]}" up-line-or-beginning-search
        bindkey -M vicmd "${keys[Down]}" up-line-or-beginning-search
    fi

    # Go to beginning of line (Home)
    if [[ -n "${keys[Home]}" ]]; then
        bindkey -M emacs "${keys[Home]}" beginning-of-line
        bindkey -M viins "${keys[Home]}" beginning-of-line
        bindkey -M vicmd "${keys[Home]}" beginning-of-line
    fi
    # Go to end of line (End)
    if [[ -n "${keys[End]}" ]]; then
        bindkey -M emacs "${keys[End]}"  end-of-line
        bindkey -M viins "${keys[End]}"  end-of-line
        bindkey -M vicmd "${keys[End]}"  end-of-line
    fi

    # Move through the completion menu backwards (Shift-Tab)
    if [[ -n "${keys[ShiftTab]}" ]]; then
        bindkey -M emacs "${keys[ShiftTab]}" reverse-menu-complete
        bindkey -M viins "${keys[ShiftTab]}" reverse-menu-complete
        bindkey -M vicmd "${keys[ShiftTab]}" reverse-menu-complete
    fi

    # Delete backward (Backspace)
    bindkey -M emacs '^?' backward-delete-char
    bindkey -M viins '^?' backward-delete-char
    bindkey -M vicmd '^?' backward-delete-char
    # Delete forward (Delete)
    if [[ -n "${keys[Delete]}" ]]; then
        bindkey -M emacs "${keys[Delete]}" delete-char
        bindkey -M viins "${keys[Delete]}" delete-char
        bindkey -M vicmd "${keys[Delete]}" delete-char
    else
        # Delete
        bindkey -M emacs "^[[3~" delete-char
        bindkey -M viins "^[[3~" delete-char
        bindkey -M vicmd "^[[3~" delete-char
        # Ctrl-Delete
        bindkey -M emacs "^[3;5~" delete-char
        bindkey -M viins "^[3;5~" delete-char
        bindkey -M vicmd "^[3;5~" delete-char
    fi

    # Delete whole backward-word (Ctrl-Backspace)
    bindkey -M emacs '^H' backward-kill-word
    bindkey -M viins '^H' backward-kill-word
    bindkey -M vicmd '^H' backward-kill-word
    # Delete whole forward-word (Ctrl-Delete)
    bindkey -M emacs '^[[3;5~' kill-word
    bindkey -M viins '^[[3;5~' kill-word
    bindkey -M vicmd '^[[3;5~' kill-word

    # Move forward one word (Ctrl-RightArrow)
    bindkey -M emacs '^[[1;5C' forward-word
    bindkey -M viins '^[[1;5C' forward-word
    bindkey -M vicmd '^[[1;5C' forward-word
    # Move backward one word (Ctrl-LeftArrow)
    bindkey -M emacs '^[[1;5D' backward-word
    bindkey -M viins '^[[1;5D' backward-word
    bindkey -M vicmd '^[[1;5D' backward-word

    # kill from the cursor to the mark (Esc-w)
    # bindkey '\eu' kill-region

    # Run command: ls (Esc-l)
    # bindkey -s '\el' 'l\n'

    # Search backward incrementally for a specified string (Esc-p)
    # The string may begin with ^ to anchor the search to the beginning of the line.
    bindkey '^P' history-incremental-search-backward

    # Don't do history expansion (Space)
    bindkey ' ' magic-space

    # Edit the current command line in $EDITOR
    # autoload -U edit-command-line
    # zle -N edit-command-line
    # bindkey '\en' edit-command-line

    # file rename magick
    # bindkey '\em' copy-prev-shell-word
}

# bindkey "${keys[PageUp]}" beginning-of-buffer-or-history
# bindkey "${keys[PageDown]}" end-of-buffer-or-history
#
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
