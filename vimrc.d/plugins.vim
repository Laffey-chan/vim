" Plugin settings
" {{{ YouCompleteMe
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-b>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" Go semantics dosen't work with gcc-go
if !empty(glob("/usr/bin/gccgo"))
    let g:ycm_filetype_specific_completion_to_disable = { 'go':1 }
endif
" }}}
" {{{ vim-todo-lists
let g:VimTodoListsMoveItems = 0
" }}}
" {{{ ultisnips
let g:UltiSnipsExpandTrigger="<TAB>"
let g:UltiSnipsJumpForwardTrigger="<TAB>"
let g:UltiSnipsJumpBackwardTrigger="<S-TAB>"
" }}}
" {{{ syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'passive' }
let g:syntastic_go_checkers = ["golint", "go"]

function! SyntasticCheckHook(errors)
	if !empty(a:errors)
		let g:syntastic_loc_list_height = min([len(a:errors), 5])
	endif
endfunction
" }}}
" {{{ airline
" cant read error messages
hi QuickFixLine ctermfg=white ctermbg=black 
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
" }}}
" {{{ vim-markdown
let g:vim_markdown_edit_url_in = 'tab'
" }}}
" {{{ NERDTree
autocmd BufEnter NERD_tree_* nmap f<CR> <CR> :NERDTreeFocus <CR>
autocmd BufLeave NERD_tree_* unmap f<CR>
" }}}
