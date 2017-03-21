# Dotfiles

File            | Description
--------------- | ----------------------------------------------------------------------------------------------------------------------
`.bash_aliases` | All bash aliases is seperated into its own file.
`.bash_profile` | Bash configurations. _Some configurations is picked up from other repositories and some configurations is done by me._
`.gitconfig`    | Git configurations and git aliases.
`.bashrc`       | Sources `.bash_profile` if it exists.
`.profile`      | Sources `.bash_profile` if it exists.
`atom_packages` | All atom packages.

All dotfiles (starts with `.`) should be moved to your home directory.<br>
Check your home directory with these commands:

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
