set nocompatible              " be iMproved, required

source ~/.vim/plugins.vim
source ~/.vim/mappings.vim
source ~/.vim/settings.vim
source ~/.vim/syntax.vim

if filereadable($HOME . "/.vim/user/". $USER . "/user.vim")
  source ~/.vim/user/$USER/user.vim
endif

source ~/.vimrc.local

let projectfile = findfile('.vimrc.project', '.;')

if !(projectfile == '' || !filereadable(projectfile))
  exec 'source ' .  projectfile
endif
