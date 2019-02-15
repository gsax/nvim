" vim-plug settings {{{
"""""""""""""""""""""""
" Plugins {{{
"""""""""""""
" vim plugins path
call plug#begin('$VIMBUNDLE')

" vim-airline: lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'

" vim-airline: a collection of themes for vim-airline
Plug 'vim-airline/vim-airline-themes'

" vim-bbye: don't close splits when closing a buffer
Plug 'moll/vim-bbye'

" vim-characterize: shows unicode of a char
Plug 'tpope/vim-characterize'

" closetag.vim: Auto close (X)HTML tags
Plug 'alvan/vim-closetag'

" deoplete: dark powered asynchronous completion framework
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" deoplete-jedi: deoplete.nvim source for Python
Plug 'zchee/deoplete-jedi', { 'for': ['python'] }

" vim-esearch: Perform search in files easily
Plug 'eugen0329/vim-esearch'

" vim-fugitive: git for vim
Plug 'tpope/vim-fugitive'

" fzf: A command-line fuzzy finder written in Go
Plug 'junegunn/fzf', { 'dir': '~/.go/src/github.com/junegunn/fzf/' }

" fzf.vim: fzf ❤️ vim
Plug 'junegunn/fzf.vim'

" vim-gitgutter: A Vim plugin which shows a git diff in the gutter
" (signcolumn) and stages/undoes hunks
Plug 'airblade/vim-gitgutter'

" vim-gnupg: transparent editing of PGP files
Plug 'jamessan/vim-gnupg'

" vim-go: Go development plugin for Vim
Plug 'fatih/vim-go'

" vim-grepper: helps you win at grep
Plug 'mhinz/vim-grepper'

" html5.vim: HTML5 omnicomplete and syntax
Plug 'othree/html5.vim'

" Vim-Jinja2-Syntax: An up-to-date jinja2 syntax file.
Plug 'Glench/Vim-Jinja2-Syntax'

" vim-man: View and grep man pages in vim
Plug 'vim-utils/vim-man'

" neomake: Async :make and linting framework for Neovim/Vim
Plug 'neomake/neomake'

" NERDCommenter: orgasmic comments
Plug 'scrooloose/nerdcommenter'

" NERDTree: a tree explorer plugin for vim
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" nerdtree-git-plugin: A plugin of NERDTree showing git status
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }

" python-mode
Plug 'klen/python-mode', { 'for': ['python'] }

" rust: vim configuration for rust
Plug 'rust-lang/rust.vim', { 'for': ['rust'] }

" scratch: Plugin to create and use a scratch Vim buffer
Plug 'gsax/scratch.vim'

" supertab: Perform all your vim insert mode completions with Tab
Plug 'ervandew/supertab'

" surround.vim: quoting/parenthesizing made simple
Plug 'tpope/vim-surround'

" tabular: Vim script for text filtering and alignment
Plug 'godlygeek/tabular'

" tmux-complete.vim: Vim plugin for insert mode completion of words in
" adjacent tmux panes 
Plug 'wellle/tmux-complete.vim'

" vim-toml: Vim syntax for TOML
Plug 'cespare/vim-toml'

" ultisnips: the ultimate snippet solution for vim
Plug 'SirVer/ultisnips'

" undotree: show the undotree
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
" }}}

" Color Schemes {{{
"""""""""""""""""""
" vim-atom-dark: A vim theme inspired by Atom's default dark theme
Plug 'gsax/vim-atom-dark'

call plug#end()
" }}}
" }}}


" Programming Section {{{
"""""""""""""""""""""""""
scriptencoding utf-8

" automatically give executable permissions if file begins with #! and
" contains '/bin/' in the path
au BufWritePost * if getline(1) =~ "^#!" | if getline(1) =~ "/bin/" | silent !chmod a+x <afile>

" set filetype to c for header (*.c) files
let c_syntax_for_h = 1
" }}}


" Misc Section {{{
""""""""""""""""""
" set python provider
let g:python_host_prog = "/home/chaisen/.local/share/nvim/Python/bin/python2"

" set python3 provider
let g:python3_host_prog = "/home/chaisen/.local/share/nvim/Python3/bin/python3"

" disable ruby
let g:loaded_ruby_provider = 1

" disable node
let g:loaded_node_provider = 1

" set colorscheme
colorscheme atom-dark

" highlight the current line
set cursorline

" keep some lines distance to the top and bottom
set scrolloff=2

" activate TrueColor support
if (has("termguicolors"))
	set termguicolors
endif
" }}}


" Plugin Configuration {{{
""""""""""""""""""""""""""
" vim-airline
source $VIMCONFIG/airline.vim

" deoplete
source $VIMCONFIG/deoplete.vim

" fzf
source $VIMCONFIG/fzf.vim

" GnuPG
source $VIMCONFIG/gnupg.vim

" Grepper
source $VIMCONFIG/grepper.vim

" custom keybindings
source $VIMCONFIG/keybindings.vim

" neomake
source $VIMCONFIG/neomake.vim

" NERDCommenter
source $VIMCONFIG/nerdcommenter.vim

" NERDTree
source $VIMCONFIG/nerdtree.vim

" python mode
source $VIMCONFIG/python-mode.vim

" ultisnips
source $VIMCONFIG/ultisnips.vim

" Undotree
source $VIMCONFIG/undotree.vim
" }}}

" vim:foldmethod=marker:foldlevel=0
