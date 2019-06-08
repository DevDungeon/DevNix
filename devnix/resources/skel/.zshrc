set -i vi

# Path tweaks
export PATH=$PATH:$HOME/bin
export GOPATH=$HOME

# Aliases
alias h='history'
alias zrc='vim ~/.zshrc'
alias zrcl='vim ~/.zshrc.local'
alias vrc='vim ~/.vimrc'
alias vrcl='vim ~/.vimrc.local'
alias py='python3'
alias py2='python2'
alias py3='python3'
alias act='source ~/venv/bin/activate'
alias ydl='youtube-dl'
alias youtube-x='youtube-dl -x --audio-format vorbis --audio-quality 0'
alias matrix='cmatrix -C cyan' 

# Load local config before initializing oh my zsh
source $HOME/.zshrc.local

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster-devnix"
plugins=(git colorize fedora ruby systemd python vi-mode)
# DISABLE_AUTO_UPDATE="true"
source $ZSH/oh-my-zsh.sh

