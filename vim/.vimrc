execute pathogen#infect()
filetype plugin indent on
syntax enable
set clipboard=exclude:cons\|linux
set nocompatible
set hidden
set wildmenu
set showcmd
set nostartofline
set ruler
set confirm
set list
set number
set relativenumber
set lazyredraw
set tabstop=4
set shiftwidth=4
set expandtab
set notimeout
set imdisable
set omnifunc=syntaxcomplete#Complete
set dictionary=/usr/share/dict/words
syntax keyword pythonBoolean False True None
autocmd BufNewFile,BufRead *.PAS set filetype=pascal
autocmd FileType vim,pascal setl shiftwidth=2 tabstop=2
autocmd FileType markdown,asciidoc set textwidth=80
autocmd BufWinEnter * let w:m1=matchadd('ColorColumn', '\%<81v.\%>80v', -1)
let mapleader = ' '
let g:stime_table = "telex"
