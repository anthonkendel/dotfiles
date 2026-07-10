# ~/.bash_profile - Main Entry Point for Bash Configuration
# Highly optimized, clean, and modular.

# Load modular configurations from ~/.bash.d/
if [ -d ~/.bash.d ]; then
  for file in ~/.bash.d/*.sh; do
    if [ -r "$file" ]; then
      . "$file"
    fi
  done
  unset file
fi
