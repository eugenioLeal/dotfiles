if ! command_exists gpg; then
  fmt_error "GnuPG is a dependency run the curl command in a safe way and install Mise"
  return 1
fi
# Check if mise executable is already found.
if [[ ! -x "$HOME/.local/bin/mise" ]]; then
  echo "$(bold)$(yellow)mise not found. Installing now...$(reset)"
  # /bin/bash -c "$(curl https://mise.run)"
  gpg --keyserver hkps://keyserver.ubuntu.com --recv-keys 0x7413A06D
  curl https://mise.jdx.dev/install.sh.sig | gpg --decrypt > install.sh
  # ensure the above is signed with the mise release key
  sh ./install.sh
  if [ $? -eq 0 ]; then
    echo "$(bold)$(green)✅ mise installed successfully.$(reset)"
    return 0
  else
    echo "❌ $(bold)$(red)Installation failed"
    return 1
  fi
else
  return 0
fi

