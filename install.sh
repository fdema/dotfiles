#!/bin/bash


DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"



dirbackup()
{
    dirname="$1"
    if [ -d ~/"$dirname" ]
    then
        echo "An existing "$dirname" folder has been found, do you wish to keep a backup("$dirname".bak) of it? (y/n)"
        read -ns 1 answer
        while [ "$answer" != "y" -a "$answer" != "n" ]
        do
            echo "Please answer with y or n."
            read -ns 1 answer
        done
        if [ "$answer" == "y" ]
        then
            mv ~/"$dirname" ~/"$dirname".bak
        else
            rm -rf ~/"$dirname"
        fi
    fi
} 

dirbackup .vim
dirbackup .zsh
dirbackup .Xrecources
dirbackup .config

localrc()
{
    filename="$1"
    if [ -f ~/"$filename" ]
    then
        if [ ! -h ~/"$filename" ]
        then
            mv ~/"$filename"  ~/"$filename".local
            echo "Your previous "$filename" is now available under ~/"$filename".local and can still be used to overwrite settings."
        else
            rm ~/"$filename"
            touch ~/"$filename".local
        fi
    fi
}

localrc .vimrc
localrc .bashrc
localrc .zshrc

#if [ -d ~/.vim ]
#then
#    echo "An existing .vim folder has been found, do you wish to keep a backup(.vim.bak) of it? (y/n)"
#    read -ns 1 answer
#    while [ "$answer" != "y" -a "$answer" != "n" ]
#    do
#        echo "Please answer with y or n."
#        read -ns 1 answer
#    done
#    if [ "$answer" == "y" ]
#    then
#        mv ~/.vim ~/.vim.bak
#    else
#        rm -rf ~/.vim
#    fi
#fi
#
#if [ -d ~/.zsh ]
#then
#    echo "An existing .zsh folder has been found, do you wish to keep a backup(.zsh.bak) of it? (y/n)"
#    read -ns 1 answer
#    while [ "$answer" != "y" -a "$answer" != "n" ]
#    do
#        echo "Please answer with y or n."
#        read -ns 1 answer
#    done
#    if [ "$answer" == "y" ]
#    then
#        mv ~/.zsh ~/.zsh.bak
#    else
#        rm -rf ~/.zsh
#    fi
#fi
#
#if [ -f ~/.Xresources ]
#then
#    echo "An existing .Xresources file has been found, do you wish to keep a backup(.Xresources.bak) of it? (y/n)"
#    read -ns 1 answer
#    while [ "$answer" != "y" -a "$answer" != "n" ]
#    do
#        echo "Please answer with y or n."
#        read -ns 1 answer
#    done
#    if [ "$answer" == "y" ]
#    then
#        mv ~/.Xresources ~/.Xresources.bak
#    else
#        rm -f ~/.Xresources
#    fi
#fi
#
#if [ -d ~/.config/powerline ]
#then
#    echo "An existing .config/powerline folder has been found, do you wish to keep a backup(.config/powerline.bak) of it? (y/n)"
#    read -ns 1 answer
#    while [ "$answer" != "y" -a "$answer" != "n" ]
#    do
#        echo "Please answer with y or n."
#        read -ns 1 answer
#    done
#    if [ "$answer" == "y" ]
#    then
#        mv ~/.config/powerline ~/.config/powerline.bak
#    else
#        rm -rf ~/.config/powerline
#    fi
#fi

#if [ -f ~/.vimrc ]
#then
#    if [ ! -h ~/.vimrc ]
#    then
#        mv ~/.vimrc  ~/.vimrc.local
#        echo "Your previous .vimrc is now available under ~/.vimrc.local and can still be used to overwrite settings."
#    else
#        rm ~/.vimrc
#        touch ~/.vimrc.local
#    fi
#fi
#
#if [ -f ~/.zshrc ]
#then
#    mv ~/.zshrc ~/.zshrc.local
#    echo "Your previous .zshrc is now available under ~/.zshrc.local and can still be used to overwrite settings."
#else
#    touch ~/.zshrc.local
#fi
#
#if [ -f ~/.bashrc ]
#then
#    mv ~/.bashrc ~/.bashrc.local
#    echo "Your previous .bashrc is now available under ~/.bashrc.local and can still be used to overwrite settings."
#else
#    touch ~/.bashrc.local
#fi

echo "Creating symlinks..."

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
