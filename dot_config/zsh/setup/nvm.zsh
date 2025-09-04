export NVM_DIR="$HOME/.nvm"

# Lazy load nvm to speed up terminal startup
if [ -s "$NVM_DIR/nvm.sh" ]; then
  # Create a function to load nvm
  load_nvm () {
    # Check if the function has already been run
    if [ ! -n "$NVM_LOADED" ]; then
      export NVM_DIR="$HOME/.nvm"
      \. "$NVM_DIR/nvm.sh"
      # run for bash or zsh (completion)
      [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
      # Set a flag to prevent re-sourcing
      export NVM_LOADED="true"
    fi
  }
  alias nvm='load_nvm && nvm'
fi

