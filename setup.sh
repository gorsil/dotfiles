#!/bin/zsh

set -e

function setup_link() {
	ln -fsr $1 $2
}

function setup_dir_link() {
	if [[ -d $2 ]] then
		if [[ -h $2 ]] then
			rm $2
		else
			mv $2 "${2}-old"
		fi
	fi
	setup_link $1 $2
}

setup_link zshrc ~/.zshrc
setup_link vimrc ~/.vimrc
setup_link xsessionrc ~/.xsessionrc

setup_dir_link oh-my-zsh ~/.oh-my-zsh
setup_dir_link zsh-syntax-highlighting ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
setup_dir_link zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions
setup_dir_link zsh-256color ~/.oh-my-zsh/plugins/zsh-256color

setup_link vim-lucius/colors/lucius.vim ~/.vim/colors

unset -f setup_link setup_dir_link
