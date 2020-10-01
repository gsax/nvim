" always enable autocompletion
autocmd BufEnter * lua require'completion'.on_attach()

" use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" avoid showing message extra message when using completion
set shortmess+=c

" how to match completions
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']

" set completion sources and the order how to use them
let g:completion_auto_change_source = 1

let g:completion_chain_complete_list = [
    \{'complete_items': ['lsp']},
    \{'complete_items': ['snippet']},
    \{'complete_items': ['path']},
    \{'mode': '<c-p>'},
    \{'mode': '<c-n>'}
\]
