#!/bin/zsh

set -e

function setup_link() {
	ln -fsr $1 $2
}

function setup_dir_link() {
	local target=$1
	local dir=$2
	local is_dotfile=$3
	local dest

	if [[ $is_dotfile ]] then
		dest="${dir}/.${target}"
	else
		dest="${dir}/${target}"
	fi

	if [[ -d $dest ]] then
		if [[ -h $dest ]] then
			rm $dest
		else
			mv $dest "${dest}-old"
		fi
	fi

	setup_link $target $dest

}

setup_link zshrc ~/.zshrc
setup_link vimrc ~/.vimrc
setup_link xsessionrc ~/.xsessionrc
setup_dir_link i3 ~/.config

setup_dir_link oh-my-zsh ~/ true
setup_dir_link zsh-syntax-highlighting ~/.oh-my-zsh/plugins
setup_dir_link zsh-autosuggestions ~/.oh-my-zsh/plugins
setup_dir_link zsh-256color ~/.oh-my-zsh/plugins

setup_link vim-lucius/colors/lucius.vim ~/.vim/colors

unset -f setup_link setup_dir_link
