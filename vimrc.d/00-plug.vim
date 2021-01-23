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

"Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --all' }          " Completion
Plug 'vim-syntastic/syntastic'          " Syntax checking

Plug 'SirVer/ultisnips'                 " Snippets
Plug 'honza/vim-snippets'               " 

Plug 'plasticboy/vim-markdown'          " Markdown
"Plug 'jceb/vim-orgmode'                 " org-mode

Plug 'vim-airline/vim-airline'          " Status/tabline

Plug 'tpope/vim-fugitive'               " Git
Plug 'aserebryakov/vim-todo-lists'      " Todo lists

Plug 'tpope/vim-speeddating'            " Increment dates
Plug 'junegunn/vim-easy-align'          " Easily align and format

call plug#end()

