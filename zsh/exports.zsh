# Editor configuration
export EDITOR=nvim
export VISUAL=nvim

# History configuration
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=2000
export SAVEHIST=5000

# XDG Base Directories
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"