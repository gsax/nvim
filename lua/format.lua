vim.cmd([[
augroup Autoformat
  autocmd!
  autocmd FileType c let &l:equalprg = 'clang-format --assume-filename %'
  autocmd FileType css,html,javascript,markdown let &l:equalprg =
        \ 'prettier --use-tabs %'
  autocmd FileType go let &l:equalprg = 'goimports | gofumpt'
  autocmd FileType lua let &l:equalprg =
        \ 'stylua --config-path $XDG_CONFIG_HOME/stylua/stylua.toml -'
  autocmd FileType python let &l:equalprg = 'black --line-length 80 --quiet -'
  autocmd FileType rust let &l:equalprg = 'rustfmt --edition 2021'
augroup END
]])
