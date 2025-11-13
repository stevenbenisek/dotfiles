# Dotfiles

Personal configuration files managed with GNU Stow. This repository uses symlinks to keep configurations under version control while allowing machine-specific customization through local overrides.

## Overview

This setup uses GNU Stow to manage dotfiles through symlinks. The repository can live anywhere on your system (e.g., `~/Developer/dotfiles`), and Stow creates symlinks in your home directory that point back to files here. This approach provides:

- Version-controlled configurations that sync across machines
- Selective installation of only the packages you need
- Machine-specific overrides without exposing personal information
- Easy backup and restoration of your development environment

## Repository Structure

Each subdirectory represents a "package" that can be installed independently. Files are organized as they would appear from your home directory:

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

## Installation

### 1. Install GNU Stow

```bash
brew install stow
```

### 2. Clone This Repository

```bash
git clone <repository-url> ~/Developer/dotfiles
cd ~/Developer/dotfiles
```

### 3. Install Packages

The target directory is configured in [.stowrc](.stowrc) as `~`, so commands automatically target your home directory.

```bash
# Install a specific package
stow git

# Install all packages
stow */

# Preview changes without applying (dry-run)
stow -n git

# Uninstall a package
stow -D git
```

**Important:** Back up any existing configuration files before stowing, as conflicts will prevent Stow from creating symlinks.

### 4. Set Up Local Configuration

After stowing, create machine-specific configuration files for personal settings:

```bash
# Example: Git user configuration
vim ~/.config/git/config.local
```

```ini
[user]
    name = Your Name
    email = your.email@example.com
```

## Tips

- Use `stow -n` to preview changes before applying them
- Each package can be stowed independently based on your needs
- Update configurations by editing the symlinked files directly
- Commit changes from within this repository to keep everything synchronized
- Keep `.local` files documented in the main config so you remember what overrides are available
