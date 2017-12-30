" Start deoplete on vim startup
let g:deoplete#enable_at_startup = 1

" Set completion style
set completeopt=longest,menuone,preview

" Cycle trough available completions with <TAB>
let g:SuperTabDefaultCompletionType = "<c-x><c-n>"

" Close preview window after completion
autocmd CompleteDone * pclose!
