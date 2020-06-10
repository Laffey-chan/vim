
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
set relativenumber number
syntax on
set shiftwidth=4
set tabstop=4
set background=dark
set nowrap
set timeoutlen=1000 ttimeoutlen=0
set wildmode=longest,list

" URxvt scrolling
set mouse=a

filetype plugin on

let maplocalleader="ö"
let mapleader="ä"

for f in split(glob('~/.vim/vimrc.d/*.vim'), '\n')
	exe 'source' f
endfor


" Filetypes
augroup filetypedetect
  au BufRead,BufNewFile *.menu set syntax=xml
augroup END

" Commands
"" Set background for transparency
command BGTransparent highlight Normal guibg=NONE ctermbg=NONE
":BGTransparent


function! SyntasticCheckHook(errors)
	if !empty(a:errors)
		let g:syntastic_loc_list_height = min([len(a:errors), 5])
	endif
endfunction


function! FunTranslate() range
	echo "firstline ".@
endfunction
function! PrintGivenRange() range
    " Get the line and column of the visual selection marks
    let [lnum1, col1] = getpos("'<")[1:2]
    let [lnum2, col2] = getpos("'>")[1:2]

    " Get all the lines represented by this range
    let lines = getline(lnum1, lnum2)         

    " The last line might need to be cut if the visual selection didn't end on the last column
    let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
    " The first line might need to be trimmed if the visual selection didn't start on the first column
    let lines[0] = lines[0][col1 - 1:]

    " Get the desired text
    let selectedText = join(lines, "\n")         

    " Do the call to tmux
    let lineCount = lnum2 - lnum1 + 2
    let translation = system("crow " . selectedText . "| tail -n+" . lineCount)
    echo translation
endfunction

function HTMLentities()
	execute a:firstline . "," . a:lastline . 's/&nbsp;/ /g'
	execute a:firstline . "," . a:lastline . 's/&lt;/</g'
	execute a:firstline . "," . a:lastline . 's/&gt;/>/g'
	execute a:firstline . "," . a:lastline . 's/&amp;/\&/g'
	execute a:firstline . "," . a:lastline . 's/&quot;/\\"/g'
	execute a:firstline . "," . a:lastline . "s/&apos;/'/g"
	execute a:firstline . "," . a:lastline . 's/&euro;/€/g'
	execute a:firstline . "," . a:lastline . 's/&auml;/ä/g'
	execute a:firstline . "," . a:lastline . 's/&Auml;/Ä/g'
	execute a:firstline . "," . a:lastline . 's/&ouml;/ö/g'
	execute a:firstline . "," . a:lastline . 's/&Ouml;/Ö/g'
	execute a:firstline . "," . a:lastline . 's/&hellip;/…/g'
	execute a:firstline . "," . a:lastline . 's/&middot;/·/g'
	execute a:firstline . "," . a:lastline . 's/&bull;/•/g'
	execute a:firstline . "," . a:lastline . 's/&ndash;/–/g'
	execute a:firstline . "," . a:lastline . 's/&frac12/½/g'
endfunction
command -range HTMLentities <line1>,<line2>call HTMLentities()

command -range  PassRange <line1>,<line2>call PrintGivenRange()
command -range  Translate execute "!crow %"

autocmd BufEnter NERD_tree_* nmap f<CR> <CR> :NERDTreeFocus <CR>
autocmd BufLeave NERD_tree_* unmap f<CR>

" Close if NERDTree is last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
