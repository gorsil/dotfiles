# Default editor
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# Go related config
export GOPATH=$HOME/go
export PATH=${PATH}:${GOROOT}/bin

# Add access to custom binaries
export PATH=${PATH}:~/opt/
export PATH=${PATH}:~/opt/bin

export DEFAULT_USER="$(whoami)"
export TERM="xterm-256color"

alias git-uncommit='git reset --soft HEAD~'
alias vimrc='vim ~/.vimrc'
alias zshrc='vim ~/.zshrc && source ~/.zshrc'
alias zshrcp='vim ~/.zshrc_private && source ~/.zshrc'
alias l='ls -l'
alias ll='ls -l'
alias lla='ls -la'

# Path to oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

ZSH_THEME="agnoster"
ENABLE_CORRECTION="true" # Command auto-correction
COMPLETION_WAITING_DOTS="true"

plugins=(
	git
	zsh-autosuggestions
	zsh-256color
   	kubectl
	yc
)

source $ZSH/oh-my-zsh.sh
source ~/.zshrc_private

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=117'

# Load fzf autocompletion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# The next line updates PATH for Yandex Cloud CLI.
if [ -f '~/yandex-cloud/path.bash.inc' ]; then source '~/yandex-cloud/path.bash.inc'; fi
