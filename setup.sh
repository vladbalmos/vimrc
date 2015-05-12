#!/bin/bash

git submodule update --init
CURRENT_PATH=$(pwd)
ln -s $CURRENT_PATH/vimrc $HOME/.vimrc
