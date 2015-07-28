let g:colorscheme_switcher_define_mappings = 0

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

" Color switcher mappings
inoremap <silent> <F9> <C-O>:NextColorScheme<CR>
nnoremap <silent> <F9> :NextColorScheme<CR>
inoremap <silent> <S-F9> <C-O>:PrevColorScheme<CR>
nnoremap <silent> <S-F9> :PrevColorScheme<CR>

" Fugitive settings
autocmd BufReadPost fugitive://* set bufhidden=delete
