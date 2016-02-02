#!/bin/bash

git submodule update --init
CURRENT_PATH=$(pwd)
ln -s $CURRENT_PATH/vimrc $HOME/.vimrc
ln -s $CURRENT_PATH/vimrc init.vim
echo -e "\033[0;31mDon't forget to run :Helptags\033[0m"
