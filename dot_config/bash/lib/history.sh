#!/bin/env bash

## Command history configuration
if [ -z "$HISTFILE" ]; then
    HISTFILE=$HOME/.bash_history
fi

# Append to the history file, don't overwrite it
shopt -s histappend

# Save multi-line commands as one command
shopt -s cmdhist

# Re-edit the command line for failing history expansions
shopt -s histreedit

# Re-edit the result of history expansions
shopt -s histverify

# save history with newlines instead of ; where possible
shopt -s lithist

# Record each line as it gets issued
PROMPT_COMMAND='history -a; history -n;'

export HISTSIZE=500000000
export HISTFILESIZE=500000000

# Avoid duplicate entries
HISTCONTROL="erasedups:ignoreboth"

# Don't record some commands
HISTIGNORE="exit:ls:bg:fg:history:clear"

# Enable incremental history search with up/down arrows (also Readline goodness)
# Learn more about this here: https://codeinthehole.com/tips/the-most-important-command-line-tip-incremental-history-searching-with-inputrc/
# bash4 specific ??
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\e[C": forward-char'
bind '"\e[D": backward-char'

# Use standard ISO 8601 timestamp
# %F equivalent to %Y-%m-%d
# %T equivalent to %H:%M:%S (24-hours format)

# Show history
#case $HIST_STAMPS in
#  "[mm/dd/yyyy]") HISTTIMEFORMAT=$'\033[31m[%m/%d/%Y] \033[36m[%T]\033[0m ' ;;
#  "[dd.mm.yyyy]") HISTTIMEFORMAT=$'\033[31m[%d.%m.%Y] \033[36m[%T]\033[0m ' ;;
#  "[yyyy-mm-dd]") HISTTIMEFORMAT=$'\033[31m[%F] \033[36m[%T]\033[0m ' ;;
#  "mm/dd/yyyy") HISTTIMEFORMAT='%m/%d/%Y %T ' ;;
#  "dd.mm.yyyy") HISTTIMEFORMAT='%d.%m.%Y %T ' ;;
#  "yyyy-mm-dd"|*) HISTTIMEFORMAT='%F %T ' ;;
#esac
