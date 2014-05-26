" =============== General Settings  ===============


if has('mouse')
    set mouse=a
endif

set number
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

 
" grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*
 
" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
"  The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'


" stop vim from creating a .netrwhist file
let g:netrw_dirhistmax=0

