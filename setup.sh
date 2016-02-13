#!/bin/bash

git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
CURRENT_PATH=$(pwd)
ln -fs $CURRENT_PATH/vimrc $HOME/.vimrc
ln -fs $CURRENT_PATH/vimrc init.vim
vim +PluginInstall +qall
