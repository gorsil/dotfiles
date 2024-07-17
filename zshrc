# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export XDG_CURRENT_DESKTOP=sway
export MOZ_ENABLE_WAYLAND=1

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

alias vimrc='vim ~/.config/nvim/init.vim'
alias zshrc='vim ~/.zshrc && source ~/.zshrc'
alias zshrcp='vim ~/.zshrc_private && source ~/.zshrc'
alias swayc='vim ~/.config/sway/config'
alias sysc='vim ~/.config/dotfiles/system.yml'
alias notes='vim ~/notes'
alias dots='vim ~/.config/dotfiles'

alias l='ls -l'
alias ll='ls -l'
alias lla='ls -la'

# Zsh configurations
export ZSH=~/.oh-my-zsh
ZSH_THEME="powerlevel10k/powerlevel10k"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=117'

export JDTLS_HOME=/usr/share/java/jdtls/
export JAVA_HOME=/usr/lib/jvm/default

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

export IDEA_JDK=/usr/lib/jvm/java-11-openjdk
export _JAVA_AWT_WM_NONREPARENTING=1

# Private config with tokens and stuff like that
[ -f ~/.zshrc_private ] && source ~/.zshrc_private

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[ -f ~/.p10k.zsh ] && source ~/.p10k.zsh

# Spin up ssh-agent
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

eval "$(direnv hook zsh)"

export YAMLFIX_EXPLICIT_START="false"
export YAMLFIX_SEQUENCE_STYLE="keep_style"
export YAMLFIX_SECTION_WHITELINES="1"
export YAMLFIX_preserve_quotes="true"
export YAMLFIX_none_representation="null"
