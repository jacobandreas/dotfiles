
" runtime
set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after
call pathogen#infect()

" global
syntax on
set showcmd
set showmatch
set mat=5
set ignorecase
set smartcase
set incsearch
set hlsearch
set autowrite
set ruler
set number
set hidden
set laststatus=2

" clipboard
set ruler

" gui
set guioptions=
set background=dark
if has('gui_running')
  set background=dark
  colorscheme solarized
endif
set gfn=Droid\ Sans\ Mono\ 8
set cursorline
set mousehide
"set mouse=a
set textwidth=80
set cc=+1

" search
runtime macros/matchit.vim
set wildmenu
set wildmode=list:longest
set scrolloff=3

" formatting
set expandtab
set tabstop=2
set shiftwidth=2
set smarttab
"set tw=80

" whitespace
set listchars=tab:▸\ ,eol:¬

" folding
" set foldmethod=syntax
" set whichwrap=h,l,[,]

" file-specific
filetype plugin on
filetype indent on

" external commands
" * grep
set grepprg=grep\ -nH\ $*
" * LaTeX
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
"let g:Tex_ViewRule_pdf='apvlv 2>/dev/null'
let g:Tex_ViewRule_pdf='evince 2>/dev/null'
let g:Tex_IgnoredWarnings = "Font Warning\nUnderfull"

" custom bindings
nmap <leader>w :set list!<CR>
nmap <leader>h :noh<CR>
map . .`[
nmap , :b 

" tabs
" au BufAdd,BufNewFile,BufRead * nested tab sball

" environment
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction
