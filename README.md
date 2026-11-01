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

### Pre-Install

Before setting up your dotfiles, ensure you have the following tools installed:

#### Install Homebrew

If you don't have Homebrew installed, install it first:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Follow the on-screen instructions to add Homebrew to your PATH.

#### Install Git

```bash
brew install git
```

#### Install GNU Stow

```bash
brew install stow
```

### Pre-Install Configuration

Before cloning and installing the dotfiles, set up your local machine-specific configurations:

#### Local Git Configuration

Create `~/.config/git/config.local` for personal Git settings that won't be committed:

```bash
mkdir -p ~/.config/git
vim ~/.config/git/config.local
```

Add your personal information:

```ini
[user]
    name = Your Name
    email = your.email@example.com
```

#### Local SSH Configuration

Create `~/.ssh/config.local` for machine-specific SSH settings:

```bash
mkdir -p ~/.ssh
chmod 700 ~/.ssh
vim ~/.ssh/config.local
```

Add any machine-specific SSH configurations as needed.

Generate an SSH key:

```bash
ssh-keygen -t ed25519-sk -C "your_email@example.com"
```

Set up `authorized_keys` for SSH access (if needed):

```bash
touch ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
```

### Install

Now you're ready to install the dotfiles:

#### Clone This Repository

```bash
git clone <repository-url> ~/Developer/dotfiles
cd ~/Developer/dotfiles
```

#### Install Packages

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

## Post-Install

### Initialize Launch Agents

After stowing the `launchd` package, you need to load the launch agents to make them active:

```bash
# Stow the launchd package first
stow launchd

# Load all launch agents
launchctl load ~/Library/LaunchAgents/*.plist

# Or load a specific agent
launchctl load ~/Library/LaunchAgents/dev.orbstack.app.plist
```

To verify that agents are loaded:

```bash
launchctl list | grep dev.orbstack
```

To unload an agent:

```bash
launchctl unload ~/Library/LaunchAgents/dev.orbstack.app.plist
```

**Note:** Launch agents will automatically start on the next login after being stowed. Manual loading is only needed for immediate activation.

## Tips

- Use `stow -n` to preview changes before applying them
- Each package can be stowed independently based on your needs
- Update configurations by editing the symlinked files directly
- Commit changes from within this repository to keep everything synchronized
- Keep `.local` files documented in the main config so you remember what overrides are available
