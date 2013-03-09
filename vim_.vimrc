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
set cursorline

" gui
colorscheme solarized
set guioptions=
call togglebg#map("<F5>") 
set background=dark
" if has('gui_running')
"   set background=dark
" endif
set gfn=Inconsolata\ 10
set mousehide
"set mouse=a
set textwidth=80
if version >= 703
  set cc=+1
endif

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
"set listchars=tab:▸\ ,eol:¬

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
"let g:Tex_ViewRule_pdf='evince 2>/dev/null'
"let g:Tex_ViewRule_pdf='okular 2>/dev/null'
let g:Tex_IgnoredWarnings = "Font Warning\nUnderfull"
let g:Tex_MultipleCompileFormats='pdf'

" custom bindings
nmap <leader>w :set list!<CR>
nmap <leader>h :noh<CR>
nmap <leader>t :NERDTree<CR>
map . .`[
nmap , :b 

" tabs
" au BufAdd,BufNewFile,BufRead * nested tab sball

" environment
" autocmd VimEnter * NERDTree
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

command -range=% Xy :<line1>,<line2>!tee >(xclip -i -sel clipboard)
command Xp r!xclip -o -sel clipboard
