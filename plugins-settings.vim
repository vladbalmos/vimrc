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
let NERDTreeShowBookmarks=1
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeAutoDeleteBuffer=1
noremap <F7> :NERDTreeToggle<CR>:wincmd t<CR>
noremap <leader>f :NERDTreeFind<CR>:wincmd t<CR>

" Tagbar
noremap <F8> :TagbarToggle<CR>

" Tagbar settings
let g:tagbar_show_linenumbers=2

" Emmet settings
let g:user_emmet_leader_key='<C-Z>'

" CtrlP
set wildignore+=*/tmp/*,*.so,*.swp,*.zip " MacOSX/Linux
let g:ctrlp_max_files = 10000
let g:ctrlp_max_depth = 20
let g:ctrlp_show_hidden = 1
let g:ctrlp_default_input = 0
let g:ctrlp_match_current_file = 1
let g:ctrlp_custom_ignore = {
 \ 'dir': '\v[\/]\.(git|hg|svn)$',
 \ 'file' : '*.*.orig'
 \ }
let g:ctrlp_extensions = ['tag', 'buffertag']
let g:ctrlp_switch_buffer = 'et'
let g:ctrlp_working_path_mode = 0
nmap <F9> :CtrlPClearCache<CR>

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
nmap <leader><leader>r :VBVimuxRunCommand<CR>
nmap <leader><leader>rp :VBVimuxCommandPrompt<CR>
nmap <leader><leader>rl :VimuxRunLastCommand<CR>

" auto-pair
let g:AutoPairsMapBS = 0

" Neomake
let g:neomake_php_enabled_makers = ['php']
let g:neomake_javascript_enabled_makers = ['jscs']
let g:neomake_ruby_enabled_makers = ['mri']
let g:neomake_open_list = 2
