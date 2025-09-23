#!/bin/env bash

# The -s flag checks if the file exists and is not empty.
if [ -s "$HOME/.iterm2_shell_integration.zsh" ]; then
  source "$HOME/.iterm2_shell_integration.zsh"
fi

