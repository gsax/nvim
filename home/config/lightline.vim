let g:lightline = {
      \ 'colorscheme': 'dracula',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly' ],
      \             [ 'relativepath', 'modified' ] ],
      \   'right': [ [ 'percent' ],
      \              [ 'lineinfo' ],
      \              [ 'filetype', 'fileencoding', 'fileformat' ] ],
      \ },
      \ 'inactive': {
      \   'left': [ [ 'relativepath' ] ],
      \   'right': [ [ 'filetype', 'fileencoding', 'fileformat' ] ],
      \ },
      \ 'component': {
      \   'lineinfo': '%3l:%-2v%<',
      \   'percent': '%2p%%',
      \ },
      \ 'component_function': {
      \   'readonly': 'LightlineReadonly',
      \   'gitbranch': 'LightlineGit',
      \ },
      \ }

" use the  symbol for readonly files
function! LightlineReadonly()
  return &readonly ? '' : ''
endfunction

" show the branch name and the  symbol, when working in git repos
function! LightlineGit()
  if exists('*gitbranch#name')
    let branch = gitbranch#name()
    return branch !=# '' ? ' '.branch : ''
  endif
  return ''
endfunction
