" Mappings
"" Normal mode mappings
""" move windows with alt + arrow
nnoremap <silent> <A-Up> :wincmd k<CR>
nnoremap <silent> <A-Down> :wincmd j<CR>
nnoremap <silent> <A-Left> :wincmd h<CR>
nnoremap <silent> <A-Right> :wincmd l<CR>
""" clear and execute current file
noremap <F4>  :! clear && %:p 
""" execute commands
noremap <F3> :! 
""" show NERDTree
noremap <C-F2> :NERDTreeToggle<CR>

"" Visual mode mappings
""" select for argument 
vnoremap <C-F> y :! <C-R>" <HOME><Right>
" copy to system clipboard
vnoremap <C-C> y :call system('xclip -selection clipboard', @0)<CR>

"" Inset mode mappings 
""" move line with shift + up/down
inoremap <S-Up>   <Esc>:m-2<CR> i
inoremap <S-Down> <Esc>:m+<CR> i
""" change window with alt+arrow 
inoremap <silent> <A-Up>    <ESC> :wincmd k \| :startinsert<CR>
inoremap <silent> <A-Down>  <ESC> :wincmd j \| :startinsert<CR>
inoremap <silent> <A-Left>  <ESC> :wincmd h \| :startinsert<CR>
inoremap <silent> <A-Right> <ESC> :wincmd l \| :startinsert<CR>
