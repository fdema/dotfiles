#/bin/bash

echo "Creating symlinks..."

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ -f ~/.vimrc ]
then
    mv ~/.vimrc  ~/.vimrc.local
    echo "Your previous .vimrc is now available under ~/.vimrc.local and can still be used to overwrite settings."
fi
if [ -f ~/.zshrc ]
then
    mv ~/.zshrc ~/.zshrc.local
    echo "Your previous .zshrc is now available under ~/.zshrc.local and can still be used to overwrite settings."
fi

if [ -f ~/.bashrc ]
then
    mv ~/.bashrc ~/.bashrc.local
    echo "Your previous .bashrc is now available under ~/.bashrc.local and can still be used to overwrite settings."
fi

ln -s $DIR/.vimrc ~/.vimrc
ln -s $DIR/.vim ~/.vim
ln -s $DIR/.zshrc ~/.zshrc
ln -s $DIR/.zsh ~/.zsh
ln -s $DIR/.bashrc ~/.bashrc
ln -s $DIR/.Xresources ~/.Xresources
ln -s $DIR/.config/powerline ~/.config/powerline

echo "Installing plugins..."

git clone https://github.com/gmarik/Vundle.vim.git $DIR/.vim/bundle/Vundle.vim >/dev/null 2>&1

vim +PluginInstall +qall

echo "Installing powerline fonts..."

if [ ! -d ~/.fonts ]
then
    mkdir ~/.fonts
fi

cd ~/.fonts 

git clone git://github.com/Lokaltog/powerline-fonts.git >/dev/null 2>&1
wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf >/dev/null 2>&1

fc-cache -vf >/dev/null

if [ ! -d ~/.config/fontconfig/conf.d ]
then
    mkdir -p ~/.config/fontconfig/conf.d
fi
wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf >/dev/null 2>&1

mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d

if [ ! -d ~/.fonts.conf.d ]
then
    ln -s ~/.config/fontconfig/conf.d ~/.fonts.conf.d
else
    ln -s ~/.config/fontconfig/conf.d/10-powerline-symbols.conf ~/.fonts.conf.d/10-powerline-symbols.conf
fi

echo "Done! Please restart your terminal emulator."
