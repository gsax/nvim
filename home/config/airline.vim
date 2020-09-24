" Set the airline theme
"let g:airline_theme = 'bubblegum'
let g:airline_theme = 'dracula'

" Use patched powerline fonts
let g:airline_powerline_fonts = 1

" Don't show buffers on top in tabline
let g:airline#extensions#tabline#enabled = 0

" Don't show the numbers of the buffers
let g:airline#extensions#tabline#buffer_nr_show = 0

" Show only the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Don't show tabs
let g:airline#extensions#tabline#show_tabs = 0

" Don't show type of tabs
let g:airline#extensions#tabline#show_tab_type = 0

" Don't use separators
let g:airline_left_sep=''
let g:airline_right_sep=''
