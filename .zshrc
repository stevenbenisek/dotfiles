export PATH=/usr/local/sbin:$PATH

export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git nvm tmux)

source $ZSH/oh-my-zsh.sh

export PATH=$HOME/.yarn/bin:$PATH

export PATH=/usr/local/opt/ruby/bin:$PATH

source $(brew --prefix)/etc/profile.d/z.sh

alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
