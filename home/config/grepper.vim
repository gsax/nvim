" Initialize grepper at startup,
" otherwise you get E121: Undefined variable:
runtime plugin/grepper.vim

" Set preferred order of grep tools.
let g:grepper.tools = ['rg', 'git', 'grep']

" Map <leader>g to start search with Grepper.
nnoremap <leader>g :Grepper<CR>
