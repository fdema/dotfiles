filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'


" Original plugins on GitHub

Plugin 'tpope/vim-fugitive' " git integration for vim
Plugin 'tpope/vim-sensible' " sensible defaults
Plugin 'tpope/vim-surround' " surround things with stuff
Plugin 'tpope/vim-abolish' " better substitution, add coercion
Plugin 'tpope/vim-repeat' " make plugin actions repeatable with . 
Plugin 'tpope/vim-eunuch' " add useful unix commands e.g. :SudoWrite
Plugin 'Lokaltog/vim-easymotion' " advanced navigation
Plugin 'scrooloose/nerdtree' " cool filebrowser
Plugin 'scrooloose/syntastic' " syntaxchecker
Plugin 'scrooloose/nerdcommenter' " use leader + ci to toggle comment out line
Plugin 'mattn/webapi-vim' "required for gist-vim
Plugin 'mattn/gist-vim' " create gists in a breeze
Plugin 'Raimondi/delimitMate' " automatic closing of quotes, parentheses,...
Plugin 'jcf/vim-latex'
Plugin 'xolox/vim-notes' " note-taking
Plugin 'xolox/vim-misc' " required for vim-notes
Plugin 'bling/vim-airline' " powerline but not bloated
Plugin 'richsoni/vim-ecliptic' " copy to system clipboard (cy)
Plugin 'airblade/vim-gitgutter' " show git diff in column next to linenumbers
Plugin 'vim-pandoc/vim-pandoc' " write documents in pandoc markdown
Plugin 'vim-pandoc/vim-pandoc-syntax' " recommended for vim-pandoc
Plugin 'vimgdb'
Plugin 'Valloric/YouCompleteMe'

" Colors
Plugin 'tomasr/molokai'
Plugin 'altercation/vim-colors-solarized'


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


" ============ gist-vim settings =============

let g:gist_open_browser_after_post = 1


" ============ airline settings ==============

let g:airline_powerline_fonts = 1

" ============ vim-latex settings ============
 
" grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
"  The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
