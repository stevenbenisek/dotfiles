# XDG Base Directories
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"

# Editor configuration
export EDITOR=nvim
export VISUAL=nvim

# FZF configuration
export FZF_DEFAULT_OPTS_FILE="$XDG_CONFIG_HOME/fzf/config"
# Use fd instead of find for faster searches
# --type f: only files (no directories)
# --hidden: include dotfiles (.gitignore, .env, etc.)
# --exclude .git: skip .git directory (thousands of objects you never want to open)
# fd also respects .gitignore by default, keeping results clean
export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'

# History configuration
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=32768  # 32³ commands in memory
export SAVEHIST=32768  # 32³ commands saved to disk

# Remove duplicates from paths
# Note: Use lowercase (fpath/path) because they're arrays tied to uppercase env vars (FPATH/PATH)
# typeset -U works on arrays, and changes automatically sync to the uppercase versions
typeset -U fpath
typeset -U path