#!/bin/bash
set -euo pipefail

# Run relative to the script's own location, regardless of caller's cwd.
cd "$(dirname "${BASH_SOURCE[0]}")"

home="$HOME"
dotfiles=".bash_aliases .bash_profile .bashrc .gitconfig .profile"
dotdirs=".bash.d"

git_fullname=""
git_email=""

# Create a fresh, uniquely-named backup dir in homedir on every run so
# repeated installs never collide with a previous run's backup.
echo
old_dotfiles="$(mktemp -d "$home/old_dotfiles.XXXXXX")"
echo "Created $old_dotfiles for backup of any existing dotfiles in $home."

# Check if .gitconfig.local exist
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
for file in $dotfiles; do
    if [ -e "$home/$file" ]; then
        echo "Moving old $file in $home to $old_dotfiles."
        mv "$home/$file" "$old_dotfiles/"
    fi
    echo "Copying $file to $home."
    cp "$file" "$home/"
done

echo
for dir in $dotdirs; do
    if [ -d "$home/$dir" ]; then
        echo "Moving old $dir in $home to $old_dotfiles."
        mv "$home/$dir" "$old_dotfiles/"
    fi
    echo "Copying $dir to $home."
    cp -r "$dir" "$home/"
done

echo
echo "Please restart your terminal."
