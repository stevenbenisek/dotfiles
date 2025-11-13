# Get the directory where this .zshrc file is located
ZSHRC_DIR="${${(%):-%x}:A:h}/.zshrc.d"

# Source exports first (other configs may depend on them)
if [ -f "$ZSHRC_DIR/exports.zsh" ]; then
  source "$ZSHRC_DIR/exports.zsh"
fi

# Source shell options
if [ -f "$ZSHRC_DIR/options.zsh" ]; then
  source "$ZSHRC_DIR/options.zsh"
fi

# Source functions
if [ -f "$ZSHRC_DIR/functions.zsh" ]; then
  source "$ZSHRC_DIR/functions.zsh"
fi

# Source aliases
if [ -f "$ZSHRC_DIR/aliases.zsh" ]; then
  source "$ZSHRC_DIR/aliases.zsh"
fi

# Source completions
if [ -f "$ZSHRC_DIR/completions.zsh" ]; then
  source "$ZSHRC_DIR/completions.zsh"
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