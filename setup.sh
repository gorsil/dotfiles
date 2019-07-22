#!/bin/zsh
if [[ -d ~/.oh-my-zsh-d ]]; then
	mv ~/.oh-my-zsh ~/.oh-my-zsh-old
fi

ln -fsr oh-my-zsh ~/
mv ~/oh-my-zsh ~/.oh-my-zsh

ln -fsr zshrc ~/.zshrc
ln -fsr vimrc ~/.vimrc

ln -fsr zsh-syntax-highlighting ~/.oh-my-zsh/plugins
ln -fsr zsh-autosuggestions ~/.oh-my-zsh/plugins
ln -fsr zsh-256color ~/.oh-my-zsh/plugins

ln -fsr vim-lucius/colors/lucius.vim ~/.vim/colors
