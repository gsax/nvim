" set directory for tagfiles
let g:gutentags_cache_dir = '/home/chaisen/.cache/tags'

" which tagging tools to use
let g:gutentags_modules = ['ctags', 'cscope']

" build cscope inverted index
let g:gutentags_cscope_build_inverted_index = 1

" settings for gutentags_plus (currently not used)
"let g:gutentags_plus_nomap = 1
"let g:gutentags_plus_switch = 1
"let g:gutentags_auto_add_cscope = 0
"let g:gutentags_auto_add_gtags_cscope = 0

nmap <Space>js :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <Space>jg :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <Space>jd :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap <Space>jc :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <Space>jt :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <Space>je :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <Space>jf :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <Space>ji :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <Space>ja :cs find a <C-R>=expand("<cword>")<CR><CR>


" keymps for gutentags_plus (currently not used)
"noremap <silent> <leader>js :GscopeFind s <C-R><C-W><cr>
"noremap <silent> <leader>jg :GscopeFind g <C-R><C-W><cr>
"noremap <silent> <leader>jd :GscopeFind d <C-R><C-W><cr>
"noremap <silent> <leader>jc :GscopeFind c <C-R><C-W><cr>
"noremap <silent> <leader>jt :GscopeFind t <C-R><C-W><cr>
"noremap <silent> <leader>je :GscopeFind e <C-R><C-W><cr>
"noremap <silent> <leader>jf :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
"noremap <silent> <leader>ji :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
"noremap <silent> <leader>ja :GscopeFind a <C-R><C-W><cr>
