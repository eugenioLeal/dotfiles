#!/bin/env bash

if [ -n "$KITTY_WINDOW_ID" ]; then
    echo "Kitty is your current terminal"
    if grep --ignore-case --quiet "nerd" "$HOME/.config/kitty/kitty.conf"; then
        echo "You currently have a nerd font installed"
        return 0
    fi
fi
if [ -n "$GHOSTTY_BIN_DIRECTORY" ]; then
    echo "Ghostty is your current terminal"
    if grep --ignore-case --quiet "nerd" "$HOME/.config/ghostty/config"; then
        echo "You currently have a nerd font installed"
        return 0
    fi
fi

echo "You have not installed a nerd font"
return 1
