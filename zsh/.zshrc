# Get the directory where this .zshrc file is located
ZSHRC_DIR="${${(%):-%x}:A:h}"

# Source exports first (other configs may depend on them)
[ -f "$ZSHRC_DIR/exports.zsh" ] && source "$ZSHRC_DIR/exports.zsh"

# Source shell options
[ -f "$ZSHRC_DIR/options.zsh" ] && source "$ZSHRC_DIR/options.zsh"

# Source completions
[ -f "$ZSHRC_DIR/completions.zsh" ] && source "$ZSHRC_DIR/completions.zsh"

# Source key bindings
[ -f "$ZSHRC_DIR/keybindings.zsh" ] && source "$ZSHRC_DIR/keybindings.zsh"

# Source aliases
[ -f "$ZSHRC_DIR/aliases.zsh" ] && source "$ZSHRC_DIR/aliases.zsh"

# Init fnm if available
if command -v fnm &> /dev/null; then
  eval "$(fnm env --use-on-cd)"
fi

# Init fzf if available
if command -v fzf &> /dev/null; then
  eval "$(fzf --zsh)"
fi

# Init Starship if available
if command -v starship &> /dev/null; then
  eval "$(starship init zsh)"
fi

# Init Zoxide if available
if command -v zoxide &> /dev/null; then
  eval "$(zoxide init zsh)"
fi