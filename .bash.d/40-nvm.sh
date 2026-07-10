# NVM (Node Version Manager) Lazy Loading

export NVM_DIR="$HOME/.nvm"

if [ -d "$NVM_DIR" ]; then
  # Lazy load NVM function
  _lazy_load_nvm() {
    # Unset helper functions to avoid recursion
    unset -f nvm node npm npx yarn
    
    # Source NVM
    if [ -s "$NVM_DIR/nvm.sh" ]; then
      . "$NVM_DIR/nvm.sh"
    fi
    
    # Source completion
    if [ -s "$NVM_DIR/bash_completion" ]; then
      . "$NVM_DIR/bash_completion"
    fi
  }

  # Register lazy loading triggers
  nvm()  { _lazy_load_nvm; nvm "$@"; }
  node() { _lazy_load_nvm; node "$@"; }
  npm()  { _lazy_load_nvm; npm "$@"; }
  npx()  { _lazy_load_nvm; npx "$@"; }
  yarn() { _lazy_load_nvm; yarn "$@"; }
fi
