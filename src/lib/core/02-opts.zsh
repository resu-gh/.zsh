#!/usr/bin/env zsh

# http://zsh.sourceforge.net/Doc/Release/Options.html

# changing directories
setopt AUTO_CD                          # if a command isn't valid, but is a directory, cd to that dir
setopt AUTO_PUSHD                       # make cd push the old directory onto the directory stack
setopt PUSHD_IGNORE_DUPS                # don’t push multiple copies of the same directory onto the directory stack
setopt PUSHD_MINUS                      # exchanges the meanings of ‘+’ and ‘-’ when specifying a directory in the stack
# completions
setopt ALWAYS_TO_END                    # move cursor to the end of a completed word
setopt AUTO_LIST                        # automatically list choices on ambiguous completion
setopt AUTO_MENU                        # show completion menu on a successive tab press
setopt AUTO_PARAM_SLASH                 # if completed parameter is a directory, add a trailing slash
setopt COMPLETE_ALIASES                 # for aliases, use separate completions rather than the aliased command
setopt COMPLETE_IN_WORD                 # complete from both ends of a word
setopt NO_MENU_COMPLETE                 # don't autoselect the first completion entry
# expansion and globbing
setopt EXTENDED_GLOB                    # use more awesome globbing features
setopt GLOB_DOTS                        # include dotfiles when globbing
setopt GLOB_STAR_SHORT                  # **/* can be abbreviated to **, ***/* to ***, etc.
# initialization
# input/output
setopt NO_CLOBBER                       # must use >| to truncate existing files
setopt NO_CORRECT                       # don't try to correct the spelling of commands
setopt NO_CORRECT_ALL                   # don't try to correct the spelling of all arguments in a line
setopt NO_FLOW_CONTROL                  # disable start/stop characters in shell editor
setopt INTERACTIVE_COMMENTS             # enable comments in interactive shell
setopt NO_MAIL_WARNING                  # don't print a warning message if a mail file has been accessed
setopt PATH_DIRS                        # perform path search even on command names with slashes
setopt RC_QUOTES                        # allow 'Henry''s Garage' instead of 'Henry'\''s Garage'
setopt NO_RM_STAR_SILENT                # ask for confirmation for `rm *' or `rm path/*'
# job control
setopt AUTO_RESUME                      # attempt to resume existing job before creating a new process
setopt NO_BG_NICE                       # don't run all background jobs at a lower priority
setopt NO_CHECK_JOBS                    # don't report on jobs when shell exit
setopt NO_HUP                           # don't kill jobs on shell exit
setopt LONG_LIST_JOBS                   # list jobs in the long format by default
setopt NOTIFY                           # report status of background jobs immediately
# prompting
setopt PROMPT_SUBST                     # expand parameters in prompt variables
# scripts and functions
# shell emulation
# shell state
# zle
setopt NO_BEEP                          # be quiet!
setopt COMBINING_CHARS                  # combine zero-length punctuation characters (accents) with the base character
setopt EMACS                            # use emacs keybindings in the shell
# history
setopt APPEND_HISTORY                   # append to history file
setopt EXTENDED_HISTORY                 # write the history file in the ':start:elapsed;command' format
setopt NO_HIST_BEEP                     # don't beep when attempting to access a missing history entry
setopt HIST_EXPIRE_DUPS_FIRST           # expire a duplicate event first when trimming history
# setopt HIST_FCNTL_LOCK                  # use fcntl for locking when writing out the history file
setopt HIST_FIND_NO_DUPS                # don't display a previously found event
setopt HIST_IGNORE_ALL_DUPS             # delete an old recorded event if a new event is a duplicate
setopt HIST_IGNORE_DUPS                 # don't record an event that was just recorded again
setopt HIST_IGNORE_SPACE                # don't record an event starting with a space
setopt HIST_NO_STORE                    # don't store history commands
setopt HIST_REDUCE_BLANKS               # remove superfluous blanks from each command line being added to the history list
setopt HIST_SAVE_NO_DUPS                # don't write a duplicate event to the history file
setopt HIST_VERIFY                      # don't execute immediately upon history expansion
setopt INC_APPEND_HISTORY               # write to the history file immediately, not when the shell exits
setopt SHARE_HISTORY                    # don't share history between all sessions
