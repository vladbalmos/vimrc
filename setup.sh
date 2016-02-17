#!/bin/bash

[ ! -d bundle/Vundle.vim ] && git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
ln -fs vimrc init.vim
cd $HOME && ln -fs .vim/vimrc .vimrc
cd $HOME/.config && ln -fs $HOME/.vim nvim
vim +PluginInstall +qall
cd $HOME/.vim/bundle/YouCompleteMe && git submodule update --init --recursive && ./install.py --tern-completer

