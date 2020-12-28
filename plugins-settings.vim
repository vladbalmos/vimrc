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
noremap <leader><leader>f :NERDTreeFind<CR>:wincmd t<CR>

" Tagbar
noremap <F8> :TagbarToggle<CR>

" Tagbar settings
let g:tagbar_show_linenumbers=2
let g:tagbar_autoclose=1

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
if filereadable('/home/vlad/.fzf/plugin/fzf.vim')
    source /home/vlad/.fzf/plugin/fzf.vim
    noremap <C-p> :Files<CR>
    noremap <leader><leader>b :Buffers<CR>
endif

" coc
if filereadable($HOME . '/.vim/bundle/coc.nvim/package.json')
    source $HOME/.vim/coc-settings.vim
endif

" editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
