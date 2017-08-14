#!/bin/sh

home=~/
old_dotfiles="old_dotfiles"
dotfiles=".bash_aliases .bash_profile .bashrc .gitconfig .profile .hyper.js"

git_fullname=""
git_email=""

# Create dotfiles_old in homedir
echo
echo "Creating $old_dotfiles for backup of any existing dotfiles in $home."
mkdir -p $home$old_dotfiles
echo "Done"

# Check if .gitconfig.local exist
echo
if [ ! -f $home".gitconfig.local" ]; then
    echo "File .gitconfig.local not found, asking for settings."
    echo "Please enter your full name: "
    read -r git_fullname
    echo "Please enter your email: "
    read -r git_email

    printf "[user]\n\tname=$git_fullname\n\temail=$git_email\n" > $home".gitconfig.local"
fi

echo
for file in $dotfiles; do
    echo "Moving old dotfiles in $home to $old_dotfiles."
    mv $home$file $home$old_dotfiles
    echo "Copying $file to $home."
    cp $file $home
done

echo
echo "Atom packages:"
cat atom_packages
read -p "Install atom_packages (y/n)? " answer
case ${answer:0:1} in
    y|Y )
        apm install --packages-file atom_packages
        echo "Done"
    ;;
    * )
    ;;
esac

echo
echo "Please restart your terminal."
