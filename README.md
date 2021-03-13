### Installation
```
sudo pacman -Syu && \
sudo pacman -S ansible && \
ansible-playbook -v config.yml
```
### Compile ycm

`cd ~/.vim/plugged/YouCompleteMe
python3 install.py --clangd-completer --go-completer --rust-completer --ts-completer`
