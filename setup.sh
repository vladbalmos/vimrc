#!/bin/bash

[ ! -d bundle/Vundle.vim ] && git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
ln -fs vimrc init.vim
cd $HOME && ln -fs .vim/vimrc .vimrc
cd $HOME/.config && ln -fs $HOME/.vim nvim
while read -p 'Disable YCM plugin?: y/[n]:' -e answ
do
    if echo "$answ" | grep -i "^[yn]$"; then
        break
    fi
done 2>&1 > /dev/null

if [ "$anws" = 'y' ]; then
    touch disable-ycm-plugin.flag
fi

vim +PluginInstall +qall

cd $HOME/.vim
if [ "$answ" = "n" ]; then
    if [ ! -f ycm-compiled.flag ]; then
        cd $HOME/.vim/bundle/YouCompleteMe && \
        git submodule update --init --recursive && \
        ./install.py --tern-completer
        cd $HOME/.vim
        touch ycm-compiled.flag
    fi
fi
