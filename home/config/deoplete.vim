" Start deoplete on vim startup
let g:deoplete#enable_at_startup = 1

" Set completion style
set completeopt=longest,menuone,preview

" Cycle trough available completions with <TAB>
let g:SuperTabDefaultCompletionType = "<c-x><c-n>"

" Close preview window after completion
autocmd CompleteDone * pclose!

" Set libclang_path for deoplete-clang
let g:deoplete#sources#clang#libclang_path = "/usr/lib/llvm/9/lib64/libclang.so.9"

" Set clang_header folder for deoplete-clang
let g:deoplete#sources#clang#clang_header = "/usr/lib/clang/9.0.0/include"
