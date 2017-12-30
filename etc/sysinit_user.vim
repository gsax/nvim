"""""""""""""""""
" USER SETTINGS "
"""""""""""""""""

" Map the leader key to space
let mapleader = "\<space>"

" Appereance {{{
""""""""""""""""
" set color of syntax highlight
set background=dark

" activate linenumbers and define their color
set number
highlight LineNr ctermfg=brown

" always display status-line
set laststatus=2

" statusline appearance
"set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
"set statusline=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%c%V\ Buf:#%n
set statusline=%<%f\ %h%m%r\ Buf:\ #%n%=%-14.(Col:\ %c%V\ Line:\ %l/%L%)\ %P
"set statusline=%<%f\ %h%m%r\ Buf:\ #%n\ %{fugitive#statusline()}\ %=%-14.(Col:\ %c%V\ Line:\ %l/%L%)\ %P

" set colors
hi statusline term=bold,reverse cterm=reverse ctermfg=0 ctermbg=2 gui=reverse
hi statuslinenc term=reverse cterm=reverse ctermfg=242 ctermbg=0 gui=reverse
hi vertsplit term=reverse cterm=reverse ctermfg=0 ctermbg=242 gui=reverse
" }}}

" Split Config {{{
""""""""""""""
" vsplit for help
cabbrev h botright vert h
map <F1> :botright vert h<CR>

" vsplit for diffsplit
set diffopt=vertical

" place splits right and under the current pane
set splitbelow
set splitright
" }}}

" Misc {{{
""""""""""
" use incremental search
set incsearch

" map leader space to clear search
nnoremap <silent><leader><space> :nohlsearch<CR>

" enable the autocompletion menu
set wildmenu

" allow modelines
set modeline

" deactivate annoying beeps
set noerrorbells visualbell t_vb=
set novisualbell

" make it possible to move outsitde the text in visual block mode
set virtualedit=block

" don't redraw the screen while executing macros
set lazyredraw

" shows the last command in bottom right
set showcmd

" don't lose undo history after switching buffers
set hidden

" highlight trailing whitespaces and spaces before tabs
highlight trailing_whitespace ctermbg=88
autocmd Syntax * syn match trailing_whitespace /\s\+$\| \+\ze\t/
" }}}

" Keymappings {{{
"""""""""""""""""
" dirty hack for wrong interpreted DEL-Key
map <F1> <del>
map! <F1> <del>

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map keys matching readline keys
"cnoremap <C-A> <Home>
"cnoremap <C-F> <Right>
"cnoremap <C-B> <Left>
"cnoremap <M-B> <S-Left>
"cnoremap <M-F> <S-Right>
"cnoremap <C-D> <Del>
cnoremap <C-U> <C-E><C-U>
" }}}

" User Scripts {{{
""""""""""""""""""
" toggle between relative and absolute line numbers
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

noremap <silent><leader>k :call NumberToggle()<CR>
" }}}

" vim:foldmethod=marker:foldlevel=0
