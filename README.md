# Dotfiles

File                     | Description
------------------------ | ----------------------------------------------------------------------------------------------------------------------
`.bash_aliases`          | All bash aliases is seperated into its own file.
`.bash_profile`          | Bash configurations. _Some configurations is picked up from other repositories and some configurations is done by me._
`.bashrc`                | Sources `.bash_profile` if it exists.
`.gitconfig`             | Git configurations and git aliases.
`.hyper.js`              | hyperterm configuration.
`.profile`               | Sources `.bash_profile` if it exists.
`atom_packages`          | All atom packages.
`install.sh`             | Installs dotfiles.
`jetbrains_settings.jar` | JetBrains IDE:s setttings.
`Software.md`            | List of useful software.

All dotfiles (starts with `.`) should be moved to your home directory.<br>
Check were your home directory is located with these commands:

Windows (cmd/powershell)

```bash
echo %USERPROFILE%
```

Unix/Linux (shell/bash)

```bash
echo $HOME
```

Atom packages is installed with the following command:

```bash
apm install --packages-file atom_packages
```

All dotfiles can be installed with `./install.sh` which moves the existing dotfiles into a folder named *old_dotfiles* in your home directory.
