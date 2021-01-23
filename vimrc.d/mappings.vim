" Mappings

" {{{ Normal mode
" move windows with alt + arrow
" TODO: how to map alt
" nnoremap <silent> <A-k> :wincmd k<CR>
" nnoremap <silent> <A-j> :wincmd j<CR>
" nnoremap <silent> <A-h> :wincmd h<CR>
" nnoremap <silent> <A-l> :wincmd l<CR>

nnoremap <leader>D :YcmCompleter GoToDefinition<CR>
nnoremap <leader>r :YcmCompleter GoToReferences<CR>
"nnoremap <leader>R :YcmCompleter RefactorRename<CR>
nmap <leader>d <plug>(YCMHover)

" clear and execute current file
noremap <F4>  :! clear && %:p 

" execute commands
noremap <F3> :! 

" show NERDTree
noremap <C-F2> :NERDTreeToggle<CR>
" }}}
" {{{ Visual mode
" move selection to command-line
vnoremap <C-F> y :! <C-R>" <HOME><Right>

" copy selection to system clipboard
if getenv("XDG_SESSION_TYPE") == "wayland"
    vnoremap <C-C> y :call system('wl-copy', @0)<CR>
else
    vnoremap <C-C> y :call system('xclip -selection clipboard', @0)<CR>
endif
" }}}
" {{{ Insert mode
" move line with shift + up/down
inoremap <S-Up>   <Esc>:m-2<CR> i
inoremap <S-Down> <Esc>:m+<CR> i
" }}}
