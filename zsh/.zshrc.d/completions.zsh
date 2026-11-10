# Initialize zsh completions
autoload -Uz compinit && compinit

# Init kubectl completion if available
if command -v kubectl &> /dev/null; then
  source <(kubectl completion zsh)
fi
