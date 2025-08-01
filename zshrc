# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export EDITOR='nvim'
export DEFAULT_USER="$(whoami)"
export TERM="xterm-256color"

# Setup go installation and work directory
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go

# Add access to custom binaries
export PATH=$PATH:~/opt/
export PATH=$PATH:~/opt/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$GOPATH/bin

# All sorts of alliases/shortcuts
alias git-uncommit='git reset --soft HEAD~'

alias vi='nvim'
alias vim='nvim'

alias vimrc='vim ~/.config/nvim/init.lua'
alias zshrc='vim ~/.zshrc && source ~/.zshrc'
alias zshrcp='vim ~/.zshrc_private && source ~/.zshrc'
alias notes='vim ~/notes'
alias dots='vim ~/.config/dotfiles'

alias l='ls -l'
alias ll='ls -l'
alias lla='ls -la'

# Zsh configurations
export ZSH=~/.oh-my-zsh
ZSH_THEME="powerlevel10k/powerlevel10k"
ENABLE_CORRECTION="false" # Rather annoying at times
COMPLETION_WAITING_DOTS="true"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=117'

# Pyenv stuff
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

plugins=(
	# General
	brew
	dotenv
	fzf
    git
	gitfast

	# Python
	poetry
	poetry-env
	pyenv
	uv

	# Zsh
	zsh-256color
	zsh-autosuggestions
	zsh-syntax-highlighting

	# Cursed
	docker
	docker-compose
	helm
	kubectl
	terraform
)

source $ZSH/oh-my-zsh.sh

# Private config with tokens and stuff like that
[ -f ~/.zshrc_private ] && source ~/.zshrc_private

# Make fzf go brrr
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[ -f ~/.p10k.zsh ] && source ~/.p10k.zsh

eval "$(direnv hook zsh)"
export PATH="$(brew --prefix python)/libexec/bin:$PATH"
