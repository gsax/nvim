" Vim filetype plugin file
" Language:	t2t

setlocal noexpandtab
setlocal tabstop=4
setlocal shiftwidth=4
setlocal autoindent
setlocal foldmethod=indent
setlocal foldnestmax=2

highlight longlines ctermbg=237

if exists('+longlines')
	setlocal longlines=120
else
	au! BufEnter <buffer> match longlines /\%120v.*/
endif
