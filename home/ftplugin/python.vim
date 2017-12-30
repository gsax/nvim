" Vim filetype plugin file
" Language:	python

setlocal expandtab
setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal autoindent
setlocal smarttab

let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions#python = [
	\ 'jedi#Complete'
	\]

let g:deoplete#sources = {}
let g:deoplete#sources['python'] = ['buffer', 'file', 'jedi']
