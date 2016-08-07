" Commands
command! VBGenTags :NeomakeSh ctags -R 2>&1 > /dev/null

" Normal mode mappings
nnoremap <C-s> :w<CR>
nnoremap <F4> :buffers<CR>:buffer<Space>
nnoremap <F3> :buffers<CR>:bd<Space>
nnoremap <leader>mdp :!cat % \| markdown > /tmp/md-render.html && reload-firefox-tab.sh /tmp/md-render.html &<CR>


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
inoremap jj <Esc>
inoremap JJ <Esc>
inoremap <C-u> <Esc>viw~ea
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-k> <Up>
inoremap <C-j> <Down>

" Visual mode mappings
vnoremap <C-c> "+y

" Terminal mode mappings
tnoremap jj <C-\><C-n>
