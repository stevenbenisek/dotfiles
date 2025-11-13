# Change directories
alias ...='cd ../..'                                     # Go up two directories
alias ....='cd ../../..'                                 # Go up three directories
alias .....='cd ../../../..'                             # Go up four directories
alias -- -='cd -'                                        # Go to previous directory
alias /='cd /'                                           # Go to root directory
alias ~='cd ~'                                           # Go to home directory
alias 1='cd -1'                                          # Go to 1st directory in stack
alias 2='cd -2'                                          # Go to 2nd directory in stack
alias 3='cd -3'                                          # Go to 3rd directory in stack
alias 4='cd -4'                                          # Go to 4th directory in stack
alias 5='cd -5'                                          # Go to 5th directory in stack
alias 6='cd -6'                                          # Go to 6th directory in stack
alias 7='cd -7'                                          # Go to 7th directory in stack
alias 8='cd -8'                                          # Go to 8th directory in stack
alias 9='cd -9'                                          # Go to 9th directory in stack

# List directories
alias ls='eza --icons --color=auto'                      # List files with icons and colors
alias l='eza -la --icons --color=auto'                   # List all files in long format with icons and colors
alias la='eza -lA --icons --color=auto'                  # List all files (except . and ..) in long format with icons
alias ll='eza -l --icons --color=auto'                   # List files in long format with icons and colors
alias lsa='eza -la --icons --color=auto'                 # List all files in long format with icons and colors
alias lt='eza -la --icons --color=auto --sort=modified'  # List all files sorted by modification time (newest first)
alias ltr='eza -la --icons --color=auto --sort=modified --reverse' # List all files sorted by modification time (oldest first)
alias ld='eza -lD --icons --color=auto'                  # List directories only
alias tree='eza --tree --icons --color=auto'             # List files in tree view

# Make directories
alias md='mkdir -p'                                      # Create directory with parent directories as needed
alias rd='rmdir'                                         # Remove empty directory

# Environment
alias fpath='echo $FPATH | tr ":" "\n"'                  # Show FPATH directories one per line
alias path='echo $PATH | tr ":" "\n"'                    # Show PATH directories one per line

# System
alias 'h?'='history_fzf'                                 # Search command history with fzf
alias reload='source ~/.zshrc'                           # Reload .zshrc configuration

# Git
alias g='git'                                            # Git shorthand
alias ga='git add'                                       # Add files to staging
alias gaa='git add --all'                                # Add all files to staging
alias gb='git branch'                                    # List branches
alias gbd='git branch --delete'                          # Delete a branch
alias gbm='git branch --move'                            # Rename a branch
alias gc='git commit --verbose'                          # Commit with verbose output
alias gc!='git commit --verbose --amend'                 # Amend last commit
alias gcb='git checkout -b'                              # Create and checkout new branch
alias 'gcb?'='git_checkout_new_branch_fzf'               # Create and checkout new branch using fzf
alias gcd='git checkout develop'                         # Checkout develop branch
alias gcm='git checkout $(git_show_main_branch)'         # Checkout main branch
alias gco='git checkout'                                  # Checkout branch
alias 'gco?'='git_checkout_branch_fzf'                   # Checkout using fzf
alias gcp='git cherry-pick'                              # Cherry-pick a commit
alias gcpa='git cherry-pick --abort'                     # Abort cherry-pick
alias gcpc='git cherry-pick --continue'                  # Continue cherry-pick
alias gd='git diff'                                      # Show changes in working directory
alias gds='git diff --staged'                            # Show staged changes
alias gfa='git fetch --all --tags --prune --jobs=10'     # Fetch all remotes with tags and prune
alias gfo='git fetch origin'                             # Fetch from origin
alias ggf='git push origin --force $(git_show_current_branch)' # Force push current branch
alias ggl='git pull origin $(git_show_current_branch)'   # Pull current branch from origin
alias gpo='git push'                                     # Push to remote
alias 'gpo?'='git_push_origin_fzf'                       # Push to origin using fzf
alias ggp='git push origin $(git_show_current_branch)'   # Push current branch to origin
alias glo='git log --oneline --decorate'                 # Show commit log in oneline format
alias grb='git rebase'                                   # Rebase current branch
alias grba='git rebase --abort'                          # Abort rebase
alias grbc='git rebase --continue'                       # Continue rebase
alias grbi='git rebase --interactive'                    # Interactive rebase
alias grbm='git rebase $(git_show_main_branch)'          # Rebase onto main branch
alias grh='git reset'                                    # Reset HEAD
alias grhh='git reset --hard'                            # Hard reset HEAD
alias grhs='git reset --soft'                            # Soft reset HEAD
alias grho='git reset --hard origin/$(git_show_current_branch)' # Hard reset to origin
alias gru='git reset --'                                 # Unstage files
alias gtv='git tag | sort -V'                            # List tags sorted by version

# Neovim
alias vi='nvim'                                          # Use Neovim for vi
alias vim='nvim'                                         # Use Neovim for vim
