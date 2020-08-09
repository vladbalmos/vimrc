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
let g:tagbar_autoclose=1

" CtrlP
set wildignore+=*/tmp/*,*.so,*.swp,*.zip " MacOSX/Linux
let g:ctrlp_max_files = 10000
let g:ctrlp_max_depth = 50
let g:ctrlp_show_hidden = 1
let g:ctrlp_default_input = 0
let g:ctrlp_match_current_file = 0
let g:ctrlp_lazy_update = 100
let g:ctrlp_custom_ignore = {
 \ 'dir': 'node_modules\|vendor\|git',
 \ 'file' : '*.*.orig'
 \ }
let g:ctrlp_extensions = ['tag', 'buffertag']
let g:ctrlp_switch_buffer = 'et'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_clear_cache_on_exit = 1
nmap <F9> :CtrlPClearCache<CR>

" vimux settings
" run current filename
nmap <leader><leader>r :VBVimuxRunCommand<CR>
nmap <leader><leader>rp :VBVimuxCommandPrompt<CR>
nmap <leader><leader>rl :VimuxRunLastCommand<CR>

" auto-pair
let g:AutoPairsMapBS = 0

" vim-json
let g:vim_json_syntax_conceal = 0

" fzf
if filereadable('/usr/share/doc/fzf/examples/fzf.vim')
    source /usr/share/doc/fzf/examples/fzf.vim
    noremap <C-p> :Files<CR>
    noremap <leader><leader>b :Buffers<CR>
endif
