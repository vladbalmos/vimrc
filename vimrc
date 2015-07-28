" LOad pathogen
if filereadable($HOME . '/.vim/plugins-settings.vim')
    source $HOME/.vim/plugins-settings.vim
endif

" Global settings
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=indent,eol,start	" more powerful backspacing
set modeline

if has("syntax")
  syntax on
endif

if has("autocmd")
  filetype plugin indent on
endif

set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set number
set incsearch
set hlsearch
set expandtab
set autoindent
set tabstop=4
set shiftwidth=4
set nowrap
set noswapfile
set nobackup
set exrc
set secure
set ignorecase
set smartcase
set scrolljump=5 " Minimal number of lines to scroll when the cursor gets off the screen.
set scrolloff=3 " Minimal number of screen liones to keep above and below the cursor.
set listchars=tab:▸\

" Leader key
:let mapleader = ' '

" GUI settings
if has('gui_running')
    :set guifont=Ubuntu\ Mono\ 10
    :set guioptions-=T  "remove toolbar
    :set guioptions-=m  "remove menu bar
    :set guioptions-=l
    :set guioptions-=r
    :set guioptions-=L
    :set guioptions-=R
    :set guioptions-=b

    " Color schme
    colorscheme apprentice
else
    colorscheme apprentice
endif

" Mappings
" Normal mode mappings
nnoremap <C-s> :w<CR>
nnoremap <C-CR> :normal O<CR>:normal o<CR>:startinsert<CR>
nnoremap <F2> :! php -l %<CR>
nnoremap <F4> :buffers<CR>:buffer<Space>
nnoremap <F3> :buffers<CR>:bd<Space>
nnoremap <F5> :CtrlPClearCache<CR>
nnoremap <F6> :!ctags -R .<CR>

" Splits navigation
nnoremap <C-j> <C-w><C-j>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>

" Resize splits bindings
nnoremap <leader>wh :vertical resize +10<CR>
nnoremap <leader>wl :vertical resize -10<CR>
nnoremap <leader>wj :resize +10<CR>
nnoremap <leader>wk :resize -10<CR>

" Maximize / Restore split
nnoremap <C-w>o :tabedit %<CR>
nnoremap <C-w>d :tabclose<CR>


" All modes mappings
noremap - ddp
noremap _ ddkP

" Insert mode mappings
inoremap <C-s> <Esc>:w<CR>:a
inoremap <C-s> <Esc><C-s>
inoremap jj <Esc>
inoremap JJ <Esc>
inoremap <Esc> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <C-CR> <Esc>:normal O<CR>:startinsert<CR>

" Magic shit
augroup BgHighlight
    autocmd!
    autocmd WinEnter * set cul
    " autocmd WinEnter * set cursorcolumn
    autocmd WinLeave * set nocul
    " autocmd WinLeave * set nocursorcolumn
augroup END

augroup RelativeNumber
    autocmd!
    autocmd WinEnter * set relativenumber
    autocmd WinLeave * set relativenumber!
augroup END

if filereadable($HOME . '/.vim/functions.vim')
    source $HOME/.vim/functions.vim
endif

if filereadable($HOME . '/.vim/work-settings.vim')
    source $HOME/.vim/work-settings.vim
endif

" http://www.vimninjas.com/2012/08/30/local-vimrc/
" Autoload project config file (if it exists)
" Do we have local vimrc?
if filereadable('.vimrc.local')
    " If so, go ahead and load it.
    source .vimrc.local
endif

" Status line
set statusline=%-.80f(%n)     " path to the file in the buffer, relative to current directory
set statusline+=\ %{fugitive#statusline()}
set statusline+=%h        " help file flag
set statusline+=%w        " preview window flag
set statusline+=%q        " quickfix list
set statusline+=%=         " start right aligning
set statusline+=[%l:%c/%L\ %p%%] " line:column/total lines (percentage though file in lines)
set statusline+=%#todo#%m%r      " modified & read only flag
