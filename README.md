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

## Zsh (macOS)

An alternate, self-contained setup for zsh (macOS's default shell) lives in [`zsh/`](zsh/):

| File           | Description                                                                                            |
| -------------- | -------------------------------------------------------------------------------------------------------|
| `zsh/.zshrc`   | Main entry point for interactive zsh config; loads every module in `zsh/.zsh.d/`, in numeric order.    |
| `zsh/.zsh.d/`  | Modular config split by concern, mirroring `.bash.d/`, with Homebrew-aware paths for git-prompt/fzf.    |
| `zsh/install.zsh` | Installs the zsh dotfiles. Also installs the shared `.bash_aliases` and `.gitconfig`, since aliases are sourced as-is by `zsh/.zsh.d/60-aliases.zsh` to keep personalization identical across both shells. |

Install with:

```bash
zsh/install.zsh
```

## Development

### Requirements

- `node` >= v10
- `npm` >= v5

### Install dependencies

```bash
npm install
```

When committing, files will be tested with [Prettier](https://prettier.io/) and the commit message with [commitlint](https://commitlint.js.org/#/) to enforce consistent style.
