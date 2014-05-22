" =============== Custom Settings ===============


" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set ruler

" show incomplete commands
set showcmd

"incremental search
set incsearch

if has('mouse')
    set mouse=a
endif

syntax on
set number
set hlsearch

set history=50

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

 
" grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*
 
" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" " The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
 
" Use line numbering
set number
 
" Ignores case when searching
set ignorecase

" Cool command tab completion
set wildmenu
 
" Overrides ignorecase when capital letters are found in search.
set smartcase
 
" For regular expressions, turn magic on.
set magic
 
" Don't redraw while executing macros (good performance config)
set lazyredraw
 
" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2
 
" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set vb t_vb=
set tm=500
 
"""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related   "
"""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab
 
" Be smart when using tabs ;)
set smarttab
 
" 1 tab == 4 spaces
set shiftwidth=4 " sets indentationcommands (< and > in normal mode)
set tabstop=4 " sets width of tab (insert mode)
set softtabstop=4 " sets amount of whitespace to be deleted with backspace
   
" Linebreak on 500 characters
set lbr
set tw=500
   
set si "Smart indent
set wrap "Wrap lines

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

"""""""""""""""""""""""""""""""""""""""
"          Powerline Options          "
"""""""""""""""""""""""""""""""""""""""

set laststatus=2
set t_Co=256
let g:Powerline_symbols = 'fancy'
