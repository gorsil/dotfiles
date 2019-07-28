## Installation

Run `./setup.sh`

This setup requires quite a bit of manual configuration atm.


``
# Install i3 manually

sudo apt-get install vim vim-nox nodejs npm node-typescript build-essential cmake python3-dev cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev python3

# Install Golang manually

# Install rust:
curl https://sh.rustup.rs -sSf | sh

# Install alacritty manually

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qa
cd ~/.vim/plugged/YouCompleteMe
python3 install.py --clangd-completer --go-completer --rust-completer --ts-completer
```
