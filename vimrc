
" create swap directory
if empty(glob('~/.vim/swap'))
    silent !mkdir -p ~/.vim/swap
endif
" create backup directory
if empty(glob('~/vim/backup'))
    silent !mkdir -p ~/.vim/backup
endif

"set encoding=UTF-8

set directory=~/.vim/swap
set backupdir=~/.vim/backup
set viminfo+='1000,n~/.vim/viminfo



"set expandtab
set number
syntax on
set tabstop=4
"set shiftwidth=4
set background=dark
set nowrap
set timeoutlen=1000 ttimeoutlen=0
set wildmode=longest,list

" URxvt scrolling
set mouse=a


colorscheme desert


hi QuickFixLine ctermfg=white ctermbg=red  


" show NERDTree
noremap <F2> :NERDTreeToggle<CR>

" execute file
noremap <F4>  :! clear && %:p 
" execute commands
nmap <F3> :! 


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


augroup filetypedetect
  au BufRead,BufNewFile *.menu set syntax=xml
augroup END



vnoremap <C-C> :w !xclip -selection clipboard<CR>


" move line with shift+up/down
inoremap <S-Up> <Esc>:m-2<CR> i
inoremap <S-Down> <Esc>:m+<CR> i

" set background for transparency
command BGTransparent highlight Normal guibg=NONE ctermbg=NONE
:BGTransparent

" change window with alt+arrow 
inoremap <silent> <A-Up>    <ESC> :wincmd k \| :startinsert<CR>
inoremap <silent> <A-Down>  <ESC> :wincmd j \| :startinsert<CR>
inoremap <silent> <A-Left>  <ESC> :wincmd h \| :startinsert<CR>
inoremap <silent> <A-Right> <ESC> :wincmd l \| :startinsert<CR>
nnoremap <silent> <A-Up> :wincmd k<CR>
nnoremap <silent> <A-Down> :wincmd j<CR>
nnoremap <silent> <A-Left> :wincmd h<CR>
nnoremap <silent> <A-Right> :wincmd l<CR>

" close if NERDTree is last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif




" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
