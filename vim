
syntax on

set showcmd
set showmatch
set ignorecase
set smartcase
set incsearch
set hlsearch
set autowrite
"set mouse=a
set ruler
set number
set hidden
runtime macros/matchit.vim
set wildmenu
set wildmode=list:longest
set scrolloff=3

set expandtab
set tabstop=4
set shiftwidth=4
set smarttab

set foldmethod=syntax

set whichwrap=h,l,[,]

set tw=80

set gfn=monospace\ 9

filetype plugin on
filetype indent on

set grepprg=grep\ -nH\ $*

let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_ViewRule_pdf='okular 2>/dev/null'
let g:Tex_IgnoredWarnings = "Font Warning\nUnderfull"

nnoremap \ss :w<CR>:!ispell %<CR>:e<CR><CR>

map . .`[
