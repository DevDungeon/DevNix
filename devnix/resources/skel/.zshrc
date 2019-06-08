# Path
export PATH=$PATH:$HOME/NanoBin/bin:$HOME/.rvm/bin:$HOME/bin
export GOPATH=$HOME


# Zsh Theme
export ZSH_THEME=flazz

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
alias rb='ruby'
alias pl='perl'

alias gdif='git diff'
alias st='git status'

alias ydl='youtube-dl'
alias youtube-x='youtube-dl -x --audio-format vorbis --audio-quality 0'

alias matrix='cmatrix -C cyan' 

alias dnfi='sudo dnf install'
alias dnfu='sudo dnf update'
alias dnfs='dnf search'
alias dnfr='sudo dnf remove'
alias dnfp='dnf provides'

# Load local config before initializing zsh
source $HOME/.zshrc.local

# "Double scp"
dscp() {
    # Pushes a file to a remote host home dir through a jump host
    # Example:
    # dscp fedjump sensu file.txt
    # dscp jump irma file.txt
    jump_host=$1
    dest_host=$2
    file_path=$3
    scp -oProxyJump=$jump_host $file_path $dest_host:
}

# "Double ssh"
dssh() {
    # Ssh through a jump host
    # Examples:
    # dssh fedjump sensu
    # dssh jump irma
    jump_host=$1
    dest_host=$2
    ssh -J $jump_host $dest_host
}

send_email() {
    to_address=$1
    message=$2
    /usr/sbin/sendmail "${to_address}" <<EOF
subject:ConsoleMailer
from:${USER}@$(hostname)

$message
EOF
    echo "Sent message to ${to_address}: $message"
}

set -i vi

#setopt autocd
## Prompt
#autoload -Uz promptinit
#promptinit
#prompt devnix cyan FFFFFF white FFFFFF

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster-devnix"
# DISABLE_AUTO_UPDATE="true"
plugins=(git colorize fedora ruby systemd python)
source $ZSH/oh-my-zsh.sh



