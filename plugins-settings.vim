" Pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

" NERDTree settings
let NERDTreeShowBookmarks=1
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeAutoDeleteBuffer=1
noremap <F7> :NERDTreeToggle<CR>:wincmd w<CR>

" Tagbar
noremap <F8> :TagbarToggle<CR>

" Tagbar settings
let g:tagbar_show_linenumbers=2

" Emmet settings
let g:user_emmet_leader_key='<C-Z>'

" CtrlP
let g:ctrlp_max_files = 10000
let g:ctrlp_max_depth = 100
let g:ctrlp_show_hidden = 1

" Papercolor Theme
set t_Co=256
"colorscheme PaperColor
