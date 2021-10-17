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
alias swayc='vim ~/.config/sway/config'
alias sysc='vim ~/.config/dotfiles/system.yml'
alias l='ls -l'
alias ll='ls -l'
alias lla='ls -la'
alias vi='nvim'
alias vim='nvim'
alias notes='nvim ~/notes'

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
	kubectl
	helm
	debian
	zsh-256color
	zsh-autosuggestions
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Private config with tokens and stuff like that
if [[ -e ~/.zshrc_private ]]; then source ~/.zshrc_private; fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
