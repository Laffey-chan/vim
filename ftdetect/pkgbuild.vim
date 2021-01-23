augroup filetype_pkgbuild
	autocmd BufNewFile,BufRead PKGBUILD 
								\ set filetype=pkgbuild |
								\ set syntax=sh
augroup END
