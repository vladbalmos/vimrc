" Normal mode mappings
nnoremap <C-s> :w<CR>
nnoremap <F4> :buffers<CR>:buffer<Space>
nnoremap <F3> :buffers<CR>:bd<Space>
nnoremap <leader><leader>c :let @" = expand("%")<CR>
nnoremap <leader><leader>n :nohlsearch<CR>


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
