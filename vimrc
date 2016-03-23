" Leader key
let mapleader = ' '

set nocompatible	" Use Vim defaults instead of 100% vi compatibility

" Load pathogen
if filereadable($HOME . '/.vim/plugins-settings.vim')
    source $HOME/.vim/plugins-settings.vim
endif

" Global settings
syntax on
set modeline " parse header / footer lines for vim settings
set backspace=indent,eol,start	" More powerful backspacing
set autoindent
set expandtab "Use spaces instead of tabs
set tabstop=4 "Nuber of spaces per tab
set shiftwidth=4 "Number of spaces to use for each stop of indentation
set shiftround
set autoread
set nrformats= " Treat numbers as decimal 
set list listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set showcmd " Show (partial) command in status line.
set showmatch " Show matching brackets.
set number relativenumber
set incsearch " Show search results while typing
set hlsearch " Highlight search results
set nowrap
set noswapfile
set nobackup
set exrc
set secure
set ignorecase
set smartcase
set scrolljump=5 " Minimal number of lines to scroll when the cursor gets off the screen.
set scrolloff=3 " Minimal number of screen liones to keep above and below the cursor.

" GUI settings
set background=dark
if has('gui_running')
    source $HOME/.vim/gui-settings.vim
else
    "colorscheme distinguished
    "colorscheme donbass
    "colorscheme dual
    "colorscheme black_angus
    "colorscheme bubblegum
    "colorscheme bvmenu
    "colorscheme candyman
    "colorscheme darkburn
    "colorscheme darkblack
    "colorscheme clue
    "colorscheme desert256
    "colorscheme desert256v2
    "colorscheme desertEx
    "colorscheme devbox-dark-256
    "colorscheme distinguished
    "colorscheme donbass
    "colorscheme flatlandia
    "colorscheme fu
    "colorscheme gruvbox
    "colorscheme harlequin
    "colorscheme hemisu
    "colorscheme herald
    "colorscheme hybrid
    "colorscheme inkpot
    "colorscheme jelleybeans
    "colorscheme kellys
    "colorscheme kolor
    "colorscheme lilypink
    "colorscheme lizard256
    "colorscheme lucius
    "colorscheme mac_classic
    "colorscheme mopkai
    "colorscheme neverland
    "colorscheme neverland-darker
    "colorscheme obsidian
    "colorscheme pencil
    "colorscheme railscasts
    "colorscheme wombat256
    "colorscheme wombat256mod
    "colorscheme muon
    "colorscheme babymate256
    colorscheme iceberg
endif


" Mappings
source $HOME/.vim/mappings.vim

if filereadable($HOME . '/.vim/functions.vim')
    source $HOME/.vim/functions.vim
endif

if filereadable($HOME . '/.vim/work-settings.vim')
    source $HOME/.vim/work-settings.vim
endif

if filereadable($HOME . '/.vim/home-settings.vim')
    source $HOME/.vim/home-settings.vim
endif

if filereadable('.vimrc.local')
    source .vimrc.local
endif


augroup PHPSettings
    autocmd!
    autocmd BufWritePost *.php Neomake
augroup END

augroup RubySettings
    autocmd!
    autocmd BufWritePost *.rb Neomake
augroup END

" Status line
set statusline=%-.80f(%n)     " path to the file in the buffer, relative to current directory
set statusline+=\ %{fugitive#statusline()}
set statusline+=%h        " help file flag
set statusline+=%w        " preview window flag
set statusline+=%q        " quickfix list
set statusline+=%=         " start right aligning
set statusline+=[%l:%c/%L\ %p%%] " line:column/total lines (percentage though file in lines)
set statusline+=%#todo#%m%r      " modified & read only flag
