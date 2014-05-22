" =============== Vundle =============== 

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'


" Original plugins on GitHub

Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'scrooloose/nerdtree'

"Colors
Plugin 'tomasr/molokai'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" =============== Settings =============== 

" Make up and down act as "move line"
no <left> <Nop>
no <right> <Nop>
no <up> ddkP
no <down> ddp

"Don't allow arrowkeys in insertmode
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>
ino <down> <Nop>

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

" only do this part when compiled with support for autocommands.
if has("autocmd")
 
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on
 
  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!
 
  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
 
  " Set indentation for specific filetypes
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType vim setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 expandtab

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
 
  augroup END
 
else
 
  set autoindent                " always set autoindenting on
 
endif " has("autocmd")
 
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
 
" Overrides ignorecase when capital letters are found in search.
set smartcase
 
" Uses relative line numbering.
"set relativenumber
 
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
 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
map <F2> :nohls<cr>

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" custom mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set timeout ttimeoutlen=100


" leader + o opens newline under current line without going to insert mode

nnoremap <leader>o o<Esc>k 
 
" ALT + O opens newline above current line without going to insert mode

nnoremap <leader>O O<Esc>j




set laststatus=2
set t_Co=256
let g:Powerline_symbols = 'fancy'
