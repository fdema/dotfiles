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
Plugin 'tpope/vim-abolish'
Plugin 'Lokaltog/vim-easymotion' " advanced navigation
Plugin 'scrooloose/nerdtree' " cool filebrowser
Plugin 'scrooloose/syntastic' " syntaxchecker
Plugin 'mattn/webapi-vim' "required for gist-vim
Plugin 'mattn/gist-vim' " create gists in a breeze
Plugin 'Raimondi/delimitMate'
Plugin 'jcf/vim-latex'
Plugin 'xolox/vim-notes' " note-taking
Plugin 'xolox/vim-misc' " required for vim-notes
Plugin 'bling/vim-airline' " powerline but not bloated
Plugin 'richsoni/vim-ecliptic'
Plugin 'sudo.vim' " execute vim with sudo priviliges
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-pandoc/vim-pandoc' " write documents in pandoc markdown
Plugin 'vim-pandoc/vim-pandoc-syntax' " recommended for vim-pandoc


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


" ============ airline settings =============

let g:airline_powerline_fonts = 1
