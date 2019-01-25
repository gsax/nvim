" Vim filetype plugin file
" Language:	ruby

setlocal expandtab
setlocal tabstop=2
setlocal shiftwidth=2
setlocal autoindent

highlight longlines ctermbg=237

if exists('+longlines')
	setlocal longlines=80
else
	au! BufEnter <buffer> match longlines /\%80v.*/
endif
