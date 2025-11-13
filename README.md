# Dotfiles

Personal configuration files managed with GNU Stow.

## Installation

### Prerequisites

Install GNU Stow:

```bash
# macOS
brew install stow

# Linux (Arch)
sudo pacman -S stow
```

### Using GNU Stow

GNU Stow creates symlinks from this repository to your home directory (or any target directory). The dotfiles repository can be stored anywhere on your system - it doesn't need to be in the target directory.

**Note:** The target directory is configured in [.stowrc](.stowrc) and set to `~` (home directory), so you don't need to specify `-t ~` in your commands.

#### Basic Usage

To install a specific package (e.g., `git`):

```bash
stow git
```

To install all packages:

```bash
stow */
```

To uninstall a package:

```bash
stow -D git
```

#### How It Works

Stow creates symlinks in the target directory (configured in [.stowrc](.stowrc) as `~`) that point back to files in this repository. For example:

- `git/.config/git/config` → `~/.config/git/config`
- `nvim/.config/nvim/init.lua` → `~/.config/nvim/init.lua`
- `zsh/.zshrc` → `~/.zshrc`

This allows you to:

- Keep your dotfiles under version control
- Store the repository anywhere (e.g., `~/Developer/dotfiles`, `~/Documents/dotfiles`, etc.)
- Easily sync configurations across machines
- Selectively install only the configurations you need

#### Tips

- Each subdirectory in this repo represents a "package" that can be stowed independently
- Files should be organized as they would appear from your home directory
- If you have existing config files, back them up before stowing
- Use `stow -n` (dry-run) to preview changes before applying them

## Structure Example

```
dotfiles/
├── git/
│   └── .config/
│       └── git/
│           └── config
├── nvim/
│   └── .config/
│       └── nvim/
│           └── init.lua
├── zsh/
│   └── .zshrc
└── ...
```
