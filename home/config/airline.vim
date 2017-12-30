" Set the airline theme
let g:airline_theme = 'minimalist'

" Use patched powerline fonts
let g:airline_powerline_fonts = 1

" Show buffers on top in tabline
let g:airline#extensions#tabline#enabled = 1

" Show the numbers of the buffers
let g:airline#extensions#tabline#buffer_nr_show = 1

" Show only the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Don't show tabs
let g:airline#extensions#tabline#show_tabs = 0

" Don't show type of tabs
let g:airline#extensions#tabline#show_tab_type = 0
