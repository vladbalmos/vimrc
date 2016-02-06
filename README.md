# vimrc

    cd $HOME
    git clone https://github.com/vladbalmos/vimrc.git .vim
    cd .vim
    ./setup.sh
    
### Adding new plugins

    cd $HOME/.vim
    git submodule add [plugin url] bundle/[name-of-plugin]

### List of plugins and uses

    ag.vim - silver searcher
    auto-pairs - brackets
    colorschemes - lots of them
    ctrlp - fuzzy searcher
    emmet-vim - html/css abbr
    jshint2 - http://jshint.com/
    matchit - improved %
    neomake - async make
    nerdcommenter - easy commenting
    nerdtree - file browser
    supertab - completion using TAB
    tagbar - list vars/functions/classes
    vdebug - support for php xdebug
    vim-colorscheme-switcher - does exactly what it says
    vim-fugitive - git support
    vim-javascript-syntax - improved support for js syntax highlighting
    vim-misc - required by colorswitcher
    vim-node - helpers for node.js dev
    vim-pathogen - plugin manager 
    vim-surround - surround text with anything you want
    vim-test - improved support for phpunit
    vim-twig - twig files syntax highlighting
    vim-unimpaired - some cool mappings
    vim-yaml - yaml syntax highlighting
    vimux - vim + tmux = love
