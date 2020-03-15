
" create swap directory
if empty(glob('~/.vim/swap'))
    silent !mkdir -p ~/.vim/swap
endif
" create backup directory
if empty(glob('~/.vim/backup'))
    silent !mkdir -p ~/.vim/backup
endif

""" Directories and files
set directory=~/.vim/swap
set backupdir=~/.vim/backup
set viminfo+='1000,n~/.vim/viminfo


colorscheme desert
"set expandtab
set number
syntax on
set shiftwidth=4
set tabstop=4
set background=dark
set nowrap
set timeoutlen=1000 ttimeoutlen=0
set wildmode=longest,list

" URxvt scrolling
set mouse=a


" Plugin settings
"" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

"" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"" airline
""" cant read error messages
hi QuickFixLine ctermfg=white ctermbg=black 
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

""" symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''


" Filetypes
augroup filetypedetect
  au BufRead,BufNewFile *.menu set syntax=xml
augroup END


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
noremap <F2> :NERDTreeToggle<CR>

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

" Commands
"" Set background for transparency
command BGTransparent highlight Normal guibg=NONE ctermbg=NONE
":BGTransparent


" Close if NERDTree is last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
