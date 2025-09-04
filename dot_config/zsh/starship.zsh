if command -v starship &> /dev/null; then
  eval "$(starship init zsh)"
else
  curl -sS https://starship.rs/install.sh | sh
  eval "$(starship init zsh)"
fi

