let g:lightline = {
      \ 'colorscheme': 'darcula',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'lineinfo': ' %3l:%-2c',
      \ },
      \ 'component_function': {
      \   'readonly': 'LightlineReadonly',
      \   'gitbranch': 'LightlineGit',
      \ },
      \ }

function! LightlineReadonly()
  return &readonly ? '' : ''
endfunction

function! LightlineGit()
  if exists('*gitbranch#name')
    let branch = gitbranch#name()
    return branch !=# '' ? ' '.branch : ''
  endif
  return ''
endfunction
