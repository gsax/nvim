vim.cmd([[
" map leader space to clear search
nnoremap <silent><leader><space> :nohlsearch<CR>

" make C-U delete the whole line in command mode
cnoremap <C-U> <C-E><C-U>

" leave terminal mode with ESC
tnoremap <Esc> <C-\><C-n>
]])
