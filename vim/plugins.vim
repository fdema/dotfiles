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
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-abolish'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
Plugin 'Raimondi/delimitMate'
Plugin 'jcf/vim-latex'
Plugin 'xolox/vim-notes'
Plugin 'xolox/vim-misc'

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


" ============ Powerline settings ============

set laststatus=2
set t_Co=256
let g:Powerline_symbols = 'fancy'

" ============ gist-vim settings =============

let g:gist_api_url = 'https://github.ugent.be/api/v3/'

let g:gist_open_browser_after_post = 1
