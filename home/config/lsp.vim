" Always enable autocompletion
autocmd BufEnter * lua require'completion'.on_attach()

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

" How to match completions
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']

" Set completion sources and the order how to use them
let g:completion_auto_change_source = 1

let g:completion_chain_complete_list = [
    \{'complete_items': ['lsp']},
    \{'complete_items': ['snippet']},
    \{'complete_items': ['path']},
    \{'mode': '<c-p>'},
    \{'mode': '<c-n>'}
\]
