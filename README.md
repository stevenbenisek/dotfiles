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

## Homebrew Package Management

### Single Brewfile Setup

For a single Brewfile configuration, use stow normally:

```bash
stow homebrew
```

This will symlink `homebrew/.config/homebrew/Brewfile` to `~/.config/homebrew/Brewfile`.

### Multiple Brewfile Setup (Context-Specific)

For managing different package sets across contexts (e.g., personal computer, home server, gaming PC), use multiple Brewfiles without stow:

#### Structure

```
homebrew/.config/homebrew/
├── Brewfile.base          # Common packages for all systems
├── Brewfile.personal      # Personal computer additions
├── Brewfile.server        # Home server specific
└── Brewfile.gaming        # Gaming computer additions
```

#### Installation

Install packages by running `brew bundle install` with the `--file` flag for each context:

```bash
# Install base packages (required on all systems)
brew bundle install --file=~/.config/homebrew/Brewfile.base

# Then install context-specific packages
brew bundle install --file=~/.config/homebrew/Brewfile.personal  # For personal computer
# OR
brew bundle install --file=~/.config/homebrew/Brewfile.server    # For home server
# OR
brew bundle install --file=~/.config/homebrew/Brewfile.gaming    # For gaming PC
```

#### Benefits

- **Native brew bundle support**: Uses standard `--file` flag without workarounds
- **Separation of concerns**: Base packages separate from context-specific ones
- **Composability**: Install only what you need per machine
- **Version control**: All Brewfiles tracked in git, no generated files
