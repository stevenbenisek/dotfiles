# XDG Base Directories
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"

# Bat configuration
export BAT_CONFIG_DIR="$XDG_CONFIG_HOME/bat"
export BAT_CONFIG_PATH="$BAT_CONFIG_DIR/bat.conf"

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

# Kubectl configuration
export KUBECONFIG="$HOME/.kube/config"

if [ -d "$HOME/.kube/config.d" ]; then
  for FILE in "$HOME/.kube/config.d/"*; do
      if [[ -f "$FILE" ]]; then
          export KUBECONFIG="$KUBECONFIG:$FILE"
      fi
  done
fi
