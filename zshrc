export EDITOR='vim'
export DEFAULT_USER="$(whoami)"
export TERM="xterm-256color"

# Setup go installation and work directory
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go

# Add access to custom binaries
export PATH=$PATH:~/opt/
export PATH=$PATH:~/opt/bin

# All sorts of alliases/shortcuts
alias git-uncommit='git reset --soft HEAD~'
alias vimrc='vim ~/.vimrc'
alias zshrc='vim ~/.zshrc && source ~/.zshrc'
alias zshrcp='vim ~/.zshrc_private && source ~/.zshrc'
alias l='ls -l'
alias ll='ls -l'
alias lla='ls -la'

# Zsh configurations
export ZSH=~/.oh-my-zsh
ZSH_THEME="agnoster"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=117'

plugins=(
	fzf
	git
	docker
	debian
	zsh-256color
	zsh-autosuggestions
	zsh-syntax-highlighting
	# yc
)

source $ZSH/oh-my-zsh.sh

# Private config with tokens and stuff like that
if [[ -e ~/.zshrc_private ]]; then source ~/.zshrc_private; fi

eval $(thefuck --alias)
if [ -f '~/yandex-cloud/path.bash.inc' ]; then source '~/yandex-cloud/path.bash.inc'; fi
