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

## Local Configuration

This repository follows a `.local` convention for machine-specific configuration that should not be version controlled. This pattern allows you to maintain shared configurations in the repository while keeping personal or machine-specific settings separate.

### Pattern

- `config` - Shared configuration (committed to repository)
- `config.local` - Machine-specific overrides (excluded from version control)

### Implementation

#### 1. In Your Dotfiles

Include a reference to the `.local` file in your main configuration:

**Git Example** (`git/.config/git/config`):
```ini
[include]
    path = ~/.config/git/config.local
```

#### 2. Create Local Config (Not in Repository)

Create your machine-specific configuration file directly in your home directory (not in this repository):

```bash
# Git example
vim ~/.config/git/config.local
```

**Example content** (`~/.config/git/config.local`):
```ini
[user]
    name = Your Name
    email = your.email@example.com
```

### Benefits

- **Portability**: Share dotfiles across machines without exposing personal information
- **Security**: Keep credentials, API keys, and personal data out of version control
- **Flexibility**: Override any setting per-machine without modifying tracked files
- **Convention**: Follows established patterns used across many tools and frameworks
