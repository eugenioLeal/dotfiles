# ==========================
# Directory Navigation Helpers
# ==========================

# Initialize custom directory stack
_dir_stack=("$PWD")

# Enhanced cd function with numbered stack support (like Zsh)
function mycd {
    local -i index
    # Support numbered cd: cd -1, cd -2, etc.
    if [[ $# -eq 1 && $1 =~ ^-[1-9]+$ ]]; then
        index=${1#-}
        if ((index >= ${#_dir_stack[@]})); then
            echo "cd: no such entry in dir stack" >&2
            return 1
        fi
        set -- "${_dir_stack[index]}"
    fi

    # Update stack, avoid duplicates
    [[ "${_dir_stack[0]}" == "$PWD" ]] || _dir_stack=("$PWD" "${_dir_stack[@]}")
    builtin cd "$@" || return $?
    _dir_stack=("$PWD" "${_dir_stack[@]}")
    for ((i = ${#_dir_stack[@]} - 1; i >= 1; i--)); do
        [[ "${_dir_stack[0]}" == "${_dir_stack[i]}" ]] && unset '_dir_stack[i]'
    done
    _dir_stack=("${_dir_stack[@]}")
}

alias cd='mycd'

# Quick parent directory shortcuts
alias ..='cd ../'
alias ...='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'
alias .6='cd ../../../../../../'

# Numbered directory stack shortcuts
alias -='cd -'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

# Quick filesystem shortcuts
alias md='mkdir -p'          # Make directory, including parents
alias rd='rmdir'             # Remove empty directory
alias po='popd'              # Use pushd/popd if desired
alias d='dirs -v | head -10' # Show top 10 directories in stack

# Directory listing shortcuts
alias l='ls -lha'
alias ll='ls -lh'
alias la='ls -lhA'
alias lsa='ls -lha'
