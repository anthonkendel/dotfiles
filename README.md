# Dotfiles

Configuration files a.k.a dotfiles

| File                     | Description                                                                                          |
| ------------------------ | ---------------------------------------------------------------------------------------------------- |
| `.bash_aliases`          | All bash aliases is seperated into its own file.                                                     |
| `.bash_profile`          | Bash configurations. _Some configurations is picked up from other repositories and some done by me._ |
| `.bashrc`                | Sources `.bash_profile` if it exists.                                                                |
| `.gitconfig`             | Git configurations and git aliases.                                                                  |
| `.profile`               | Sources `.bash_profile` if it exists.                                                                |
| `install.bash`           | Installs dotfiles.                                                                                   |
| `jetbrains_settings.jar` | JetBrains IDE:s setttings.                                                                           |
| `vscode_extensions`      | All vscode extensions.                                                                               |
| `vscodeSettings.json`    | User settings for vscode.                                                                            |

## Development

### Requirements

- `node` >= v10
- `npm` >= v5

### Install dependencies

```bash
npm install
```

When commiting, files will be tested with [Prettier](https://prettier.io/) and the commmit message with [commitlint](https://commitlint.js.org/#/) to enfore consistent style.
