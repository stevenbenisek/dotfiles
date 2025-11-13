# Change directories
alias ...='cd ../..'                  # Go up two directories
alias ....='cd ../../..'              # Go up three directories
alias .....='cd ../../../..'          # Go up four directories
alias -- -='cd -'                     # Go to previous directory
alias /='cd /'                        # Go to root directory
alias ~='cd ~'                        # Go to home directory
alias 1='cd -1'                       # Go to 1st directory in stack
alias 2='cd -2'                       # Go to 2nd directory in stack
alias 3='cd -3'                       # Go to 3rd directory in stack
alias 4='cd -4'                       # Go to 4th directory in stack
alias 5='cd -5'                       # Go to 5th directory in stack
alias 6='cd -6'                       # Go to 6th directory in stack
alias 7='cd -7'                       # Go to 7th directory in stack
alias 8='cd -8'                       # Go to 8th directory in stack
alias 9='cd -9'                       # Go to 9th directory in stack

# List directories
alias l='ls -lah'                     # List all files in long format with human-readable sizes
alias la='ls -lAh'                    # List all files (except . and ..) in long format
alias ll='ls -lh'                     # List files in long format with human-readable sizes
alias lsa='ls -lah'                   # List all files in long format with human-readable sizes

# Make directories
alias md='mkdir -p'                   # Create directory with parent directories as needed
alias rd='rmdir'                      # Remove empty directory

# Git
alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gb='git branch'
alias gbd='git branch --delete'
alias gbm='git branch --move'
alias gc='git commit --verbose'
alias gc!='git commit --verbose --amend'
alias gcb='git checkout -b'
alias gcd='git checkout develop'
alias gcm='git show-ref --quiet refs/heads/main && git checkout main || git checkout master'
alias gco='git checkout'
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'
alias gd='git diff'
alias gds='git diff --staged'
alias gfa='git fetch --all --tags --prune --jobs=10'
alias gfo='git fetch origin'
alias ggf='git push origin --force $(git branch --show-current)'
alias ggl='git pull origin $(git branch --show-current)'
alias ggp='git push origin $(git branch --show-current)'
alias glo='git log --oneline --decorate'
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbi='git rebase --interactive'
alias grh='git reset'
alias grhh='git reset --hard'
alias grhs='git reset --soft'
alias grho='git reset --hard origin/$(git branch --show-current)'
alias gru='git reset --'

# Neovim
alias vi='nvim'
alias vim='nvim'
