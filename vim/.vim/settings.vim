" =============== General Settings  ===============

if has('mouse')
    set mouse=a
endif

" relative numbers only in normal mode

set number
set relativenumber
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

set cursorline " highlight current line

" search settings
set hlsearch
set ignorecase
set smartcase

set magic " improve regex
set showmatch " show matching brackets under cursor


" ========== Text, tab and indent related ==========

" 1 tab = 4 spaces
set expandtab
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


" ================= Theme settings =================

let g:solarized_termcolors=256
:colorscheme solarized
set background=dark


" ================= Other settings =================

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif


" stop vim from creating a .netrwhist file
let g:netrw_dirhistmax=0
