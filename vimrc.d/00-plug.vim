" Download vim-plug if it dosen't exist
let plugpath = expand("~/.vim/autoload/plug.vim")
if !filereadable(plugpath)
    if executable("curl")
        let url = "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
        let output = system("curl -fLo " . shellescape(plugpath) . " --create-dirs " . url)
        if v:shell_error != 0
            echom "Error downloading vim-plug"
            exit
        endif
    else
        echom "Can't install vim-plug."
        exit
    endif
endif


call plug#begin('~/.vim/plugged')

Plug 'https://gitlab.com/yrhki/vim-blackout.git'

" Completion
"Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --all' }
" Syntax checking
Plug 'vim-syntastic/syntastic'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Markdown
Plug 'plasticboy/vim-markdown'
" org-mode
"Plug 'jceb/vim-orgmode'

" Status/tabline
Plug 'vim-airline/vim-airline'

" Git
Plug 'tpope/vim-fugitive'
" Todo lists
Plug 'aserebryakov/vim-todo-lists'

" Increment dates
Plug 'tpope/vim-speeddating'
" Easily align and format
Plug 'junegunn/vim-easy-align'

call plug#end()

