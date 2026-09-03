#!/bin/zsh
set -euo pipefail

# Run relative to the repo root, regardless of caller's cwd.
script_dir="$(cd "$(dirname "$0")" && pwd)"
cd "$script_dir/.."

home="$HOME"
# Shell-agnostic files, shared with the bash setup, sourced from repo root.
shared_dotfiles=(.bash_aliases .gitconfig)
# Zsh-specific files/dirs, sourced from this zsh/ folder.
zsh_dotfiles=(.zshrc)
zsh_dotdirs=(.zsh.d)

git_fullname=""
git_email=""

# Create a fresh, uniquely-named backup dir in homedir on every run so
# repeated installs never collide with a previous run's backup.
echo
old_dotfiles="$(mktemp -d "$home/old_dotfiles.XXXXXX")"
echo "Created $old_dotfiles for backup of any existing dotfiles in $home."

# Check if .gitconfig.local exists
echo
if [ ! -f "$home/.gitconfig.local" ]; then
    echo "File .gitconfig.local not found, asking for settings."
    echo "Please enter your full name: "
    read -r git_fullname
    echo "Please enter your email: "
    read -r git_email

    printf '[user]\n\tname=%s\n\temail=%s\n' "$git_fullname" "$git_email" > "$home/.gitconfig.local"
fi

echo
for file in "${shared_dotfiles[@]}"; do
    if [ -e "$home/$file" ]; then
        echo "Moving old $file in $home to $old_dotfiles."
        mv "$home/$file" "$old_dotfiles/"
    fi
    echo "Copying $file to $home."
    cp "$file" "$home/"
done

echo
for file in "${zsh_dotfiles[@]}"; do
    if [ -e "$home/$file" ]; then
        echo "Moving old $file in $home to $old_dotfiles."
        mv "$home/$file" "$old_dotfiles/"
    fi
    echo "Copying $file to $home."
    cp "zsh/$file" "$home/"
done

echo
for dir in "${zsh_dotdirs[@]}"; do
    if [ -d "$home/$dir" ]; then
        echo "Moving old $dir in $home to $old_dotfiles."
        mv "$home/$dir" "$old_dotfiles/"
    fi
    echo "Copying $dir to $home."
    cp -r "zsh/$dir" "$home/"
done

echo
if [ "$SHELL" != "$(command -v zsh)" ]; then
    echo "Tip: zsh isn't your default shell yet. Run 'chsh -s $(command -v zsh)' to make it so."
fi

echo
echo "Please restart your terminal (or run: exec zsh)."
