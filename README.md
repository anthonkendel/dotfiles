# Dotfiles

Configuration files a.k.a dotfiles

| File            | Description                                                                                            |
| --------------- | ------------------------------------------------------------------------------------------------------ |
| `.bash_aliases` | All bash aliases is separated into its own file.                                                       |
| `.bash_profile` | Main entry point for interactive bash config; loads every module in `.bash.d/`, in numeric order.      |
| `.bash.d/`      | Modular config split by concern (env, history, colors/prompt, completion, nvm, fzf, aliases, options). |
| `.bashrc`       | Sources `.bash_profile` if it exists.                                                                  |
| `.gitconfig`    | Git configurations and git aliases.                                                                    |
| `.profile`      | Sources `.bash_profile` if it exists.                                                                  |
| `install.bash`  | Installs dotfiles.                                                                                     |

## Development

### Requirements

- `node` >= v10
- `npm` >= v5

### Install dependencies

```bash
npm install
```

When committing, files will be tested with [Prettier](https://prettier.io/) and the commit message with [commitlint](https://commitlint.js.org/#/) to enforce consistent style.
