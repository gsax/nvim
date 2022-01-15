" use goimports as gofmt command
let g:go_fmt_command = "gopls"
let g:go_imports_autosave = 1

" activate some extra syntax highlighting
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1

" show name of failed tests
let g:go_test_show_name = 1

" don't show goinfo in the quickfix window,
" when ending the completion with <ESC>
let g:go_echo_go_info = 0
