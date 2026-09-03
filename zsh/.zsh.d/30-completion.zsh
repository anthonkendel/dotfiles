# Programmable Zsh Completion

# Make sure Homebrew-installed completion functions are found
if command -v brew >/dev/null 2>&1; then
  fpath=("$(brew --prefix)/share/zsh/site-functions" $fpath)
fi

autoload -Uz compinit
compinit
