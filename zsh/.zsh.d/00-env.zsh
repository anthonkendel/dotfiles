# Environment & PATH Configuration

# Homebrew (Apple Silicon default /opt/homebrew, Intel default /usr/local)
if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x /usr/local/bin/brew ]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# Add local bin to PATH if not already present
if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
  export PATH="$HOME/.local/bin:$PATH"
fi

# Lesspipe for friendly non-text input (Homebrew installs it as lesspipe.sh)
if command -v lesspipe.sh >/dev/null 2>&1; then
  eval "$(SHELL=/bin/sh lesspipe.sh)"
elif command -v lesspipe >/dev/null 2>&1; then
  eval "$(SHELL=/bin/sh lesspipe)"
fi
