# ~/.zshrc - Main Entry Point for Zsh Configuration
# Mirrors .bash_profile's structure; loads every module in ~/.zsh.d/, in numeric order.

if [ -d ~/.zsh.d ]; then
  for file in ~/.zsh.d/*.zsh; do
    if [ -r "$file" ]; then
      . "$file"
    fi
  done
  unset file
fi
