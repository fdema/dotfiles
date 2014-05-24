#/bin/bash

echo "Creating symlinks..."

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ -d ~/.vim ]
then
    echo "An existing .vim folder has been found, do you wish keep a backup(.vim.bak) of it? (y/n)"
    read answer
    if [ "$answer" == "y" ]
    then
        mv ~/.vim ~/.vim.bak
    elif [ "$answer" == "n" ]
    then
        rm -rf ~/.vim
    else
        mv ~/.vim ~.vim.bak
        echo "Please answer with y or n next time."
    fi
fi

if [ -d ~/.zsh ]
then
    echo "An existing .zsh folder has been found, do you wish keep a backup(.zsh.bak) of it? (y/n)"
    read answer
    if [ "$answer" == "y" ]
    then
        mv ~/.zsh ~/.zsh.bak
    elif [ "$answer" == "n" ]
    then
        rm -rf ~/.zsh
    else
        mv ~/.zsh ~/.zsh.bak
        echo "Please answer with y or n next time."
    fi
fi

if [ -f ~/.Xresources ]
then
    echo "An existing .Xresources file has been found, do you wish keep a backup(.Xresources.bak) of it? (y/n)"
    read answer
    if [ "$answer" == "y" ]
    then
        mv ~/.Xresources ~/.Xresources.bak
    elif [ "$answer" == "n" ]
    then
        rm -f ~/.Xresources
    else
        mv ~/.Xresources ~/.Xresources.bak
        echo "Please answer with y or n next time."
    fi
fi

if [ -d ~/.config/powerline ]
then
    echo "An existing .config/powerline folder has been found, do you wish keep a backup(.config/powerline.bak) of it? (y/n)"
    read answer
    if [ "$answer" == "y" ]
    then
        mv ~/.config/powerline ~/.config/powerline.bak
    elif [ "$answer" == "n" ]
    then
        rm -rf ~/.config/powerline
    else
        mv ~/.config/powerline ~/.config/powerline.bak
        echo "Please answer with y or n next time."
    fi
fi

if [ -f ~/.vimrc -a ! -h ~/.vimrc ]
then
    mv ~/.vimrc  ~/.vimrc.local
    echo "Your previous .vimrc is now available under ~/.vimrc.local and can still be used to overwrite settings."
else
    rm ~/.vimrc
    touch ~/.vimrc.local
fi
if [ -f ~/.zshrc ]
then
    mv ~/.zshrc ~/.zshrc.local
    echo "Your previous .zshrc is now available under ~/.zshrc.local and can still be used to overwrite settings."
else
    touch ~/.zshrc.local
fi

if [ -f ~/.bashrc ]
then
    mv ~/.bashrc ~/.bashrc.local
    echo "Your previous .bashrc is now available under ~/.bashrc.local and can still be used to overwrite settings."
else
    touch ~/.bashrc.local
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
