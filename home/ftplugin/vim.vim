" Vim filetype plugin file
" Language:	vim

setlocal noexpandtab
setlocal tabstop=2
setlocal shiftwidth=2
setlocal autoindent
setlocal foldmethod=indent
setlocal foldnestmax=2

highlight longlines ctermbg=237

if exists('+longlines')
	setlocal longlines=80
else
	au! BufEnter <buffer> match longlines /\%80v.*/
endif
