#!/bin/bash


DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Creating directories..."

backup()
{
    filename="$1"
    if [ -d ~/"$filename" ]
    then
        echo "An existing "$filename" folder has been found, do you wish to keep a backup("$filename".bak) of it? (y/n)"
        read -s -n 1 answer
        while [ "$answer" != "y" -a "$answer" != "n" ]
        do
            echo "Please answer with y or n."
            read -s -n 1 answer
        done
        if [ "$answer" == "y" ]
        then
            mv ~/"$filename" ~/"$filename".bak
        else
            rm -rf ~/"$filename"
        fi
    elif [ -f ~/"$filename" ]
    then
        echo "An existing "$filename" file has been found, do you wish to keep a backup("$filename".bak) of it? (y/n)"
        read -s -n 1 answer
        while [ "$answer" != "y" -a "$answer" != "n" ]
        do
            echo "Please answer with y or n."
            read -s -n 1 answer
        done
        if [ "$answer" == "y" ]
        then
            mv ~/"$filename" ~/"$filename".bak
        else
            rm -rf ~/"$filename"
        fi
    fi
} 

backup .vim
backup .zsh
backup .Xresources
backup .config/powerline

localrc()
{
    filename="$1"
    if [ -f ~/"$filename" ]
    then
        if [ ! -h ~/"$filename" ]
        then
            if [ -f "$filename".local]
            then
                mv ~/"$filename" ~/"$filename".bak
            else
                mv ~/"$filename"  ~/"$filename".local
                echo "Your previous "$filename" is now available under ~/"$filename".local and can still be used to overwrite settings."
            fi
        else
            rm ~/"$filename"
            touch ~/"$filename".local
        fi
    fi
}

localrc .vimrc
localrc .bashrc
localrc .zshrc


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
elif [ ! -f ~/.fonts.conf.d/10-powerline-symbols.conf ]
then
    ln -s ~/.config/fontconfig/conf.d/10-powerline-symbols.conf ~/.fonts.conf.d/10-powerline-symbols.conf
fi

echo "Done! Please restart your terminal emulator."
