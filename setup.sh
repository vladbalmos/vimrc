#!/bin/bash

git submodule update --init
CURRENT_PATH=$(pwd)
ln -s $CURRENT_PATH/vimrc $HOME/.vimrc
echo -e "\033[0;31mDon't forger to run :Helptags\033[0m"
