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
set list listchars+=tab:\|\ 
set number relativenumber lazyredraw
set tabstop=8 expandtab shiftwidth=4 softtabstop=4 smarttab
set notimeout
set imdisable
set omnifunc=syntaxcomplete#Complete
set dictionary=/usr/share/dict/words
syntax keyword pythonBoolean False True None
autocmd BufNewFile,BufRead *.PAS set filetype=pascal
autocmd FileType vim,pascal setlocal shiftwidth=2 tabstop=2
autocmd FileType c setlocal noexpandtab shiftwidth=8 tabstop=8
autocmd FileType markdown,asciidoc setlocal textwidth=79
autocmd BufWinEnter * let w:m1=matchadd('ColorColumn', '\%<81v.\%>80v', -1)
let mapleader = ' '
let g:stime_table = "telex"
