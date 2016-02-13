let g:colorscheme_switcher_define_mappings = 0

filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
source $HOME/.vim/plugins.vim
call vundle#end()
filetype plugin indent on    " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" NERDTree settings
let NERDTreeQuitOnOpen=1
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
let g:ctrlp_custom_ignore = {
 \ 'dir': 'build'
 \ }

" Papercolor Theme
"set t_Co=256
"colorscheme PaperColor

" Color switcher mappings
inoremap <silent> <F9> <C-O>:NextColorScheme<CR>
nnoremap <silent> <F9> :NextColorScheme<CR>
inoremap <silent> <C-S-F9> <C-O>:PrevColorScheme<CR>
nnoremap <silent> <C-S-F9> :PrevColorScheme<CR>

" Fugitive settings
autocmd BufReadPost fugitive://* set bufhidden=delete

" vim-test settings
nmap <leader>t :TestNearest<CR>
nmap <leader>T :TestFile<CR>
nmap <leader>a :TestSuite<CR>
nmap <leader>l :TestLast<CR>
nmap <leader>g :TestVisit<CR>

" vimux settings
" run current filename
nmap <leader><leader>r :VimuxRunCommand("<C-r>%")<CR>
nmap <leader><leader>rl :VimuxRunLastCommand<CR>

" auto-pair
let g:AutoPairsMapBS = 0

" Neomake
let g:neomake_php_enabled_makers = ['php']
