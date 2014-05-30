set nocompatible              " be iMproved, required

source ~/.vim/plugins.vim
source ~/.vim/mappings.vim
source ~/.vim/settings.vim
source ~/.vim/syntax.vim

if filereadable("~/.vim/user/$USER/user.vim")
  source ~/.vim/user/$USER/user.vim
endif

source ~/.vimrc.local

if filereadable("./.vimrc.project")
  source ./.vimrc.project
endif
