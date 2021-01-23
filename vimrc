" Create swap directory
if empty(glob('~/.vim/swap'))
    silent !mkdir -p ~/.vim/swap
endif

" Create backup directory
if empty(glob('~/.vim/backup'))
    silent !mkdir -p ~/.vim/backup
endif

" Directories and files
set directory=~/.vim/swap
set backupdir=~/.vim/backup
set viminfo+='1000,n~/.vim/viminfo

" Enable mouse
set mouse=a

for f in split(glob('~/.vim/vimrc.d/*.vim'), '\n')
	exe 'source' f
endfor

" Close if NERDTree is last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
