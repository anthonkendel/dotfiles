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
`vscode_extensions`      | All vscode extensions.
`install.sh`             | Installs dotfiles.
`vscodeSettings`         | User settings for vscode.
`jetbrains_settings.jar` | JetBrains IDE:s setttings.
`Software.md`            | List of useful software.

Atom packages is installed with the following command:

```bash
apm install --packages-file atom_packages
```