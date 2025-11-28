# Get the directory where this .zshrc file is located
ZSHRC_DIR="${${(%):-%x}:A:h}/.zshrc.d"

# Source config files in order
for config_file in exports paths options functions aliases completions; do
  if [ -f "$ZSHRC_DIR/${config_file}.zsh" ]; then
    source "$ZSHRC_DIR/${config_file}.zsh"
  fi
done

# Source local config
if [ -f "$HOME/.zshrc.local" ]; then
  source "$HOME/.zshrc.local"
fi

# Init mise if available
if command -v mise &> /dev/null; then
  eval "$(mise activate zsh)"
fi

# Init fzf if available
if command -v fzf &> /dev/null; then
  eval "$(fzf --zsh)"
fi

# Init Zoxide if available
if command -v zoxide &> /dev/null; then
  eval "$(zoxide init zsh)"
fi

# Init Starship if available (should be last)
if command -v starship &> /dev/null; then
  eval "$(starship init zsh)"
fi
