#/bin/bash

echo "Creating symlinks..."

DIR=$($(cd '$(dirname "$0")') && pwd)


ln -s $DIR/.vimrc ~/.vimrc
ln -s $DIR/.vim ~/.vim
ln -s $DIR/.zshrc ~/.zshrc
ln -s $DIR/.zsh ~/.zsh
ln -s $DIR/.bashrc ~/.bashrc
ln -s $DIR/.config/powerline ~/.config/powerline

echo "Installing plugins..."

git clone https://github.com/gmarik/Vundle.vim.git $DIR/.vim/bundle/Vundle.vim

vim -c 'PluginInstall' \
    -c 'qa'

echo "Installing powerline fonts..."

if [ ! -d ~/.fonts]
    mkdir ~/.fonts
fi

cd ~/.fonts 

git clone git://github.com/Lokaltog/powerline-fonts.git
wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
fc-cache -vf

if [ ! -d ~/.config/fontconfig/conf.d]
    mkdir ~/.config/fontconfig/conf.d
fi
wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf

mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d

if [ ! -d ~/.fonts.conf.d]
    rm ~/.fonts.conf.d
fi

ln -s ~/.config/fontconfig/conf.d/ ~/.fonts.conf.d

"Done! Please restart your terminal emulator."
