#!/bin/bash


DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "================================================================="
echo "||     Most welcome to the interactive dotfiles installer!     ||"
echo "|| Thou shalt be guided to a better life in a better workflow! ||"
echo "================================================================="

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


echo "Dost thou desire to install zsh config files? (y/n)"
read -s -n 1 answer
while [ "$answer" != "y" -a "$answer" != "n" ]
do
    echo "Please answer with y or n."
    read -s -n 1 answer
done
if [ "$answer" == "y" ]
then
    echo "Installing zsh config files..."
    backup .zsh
    localrc .zshrc
    ln -s $DIR/.zshrc ~/.zshrc
    ln -s $DIR/.zsh ~/.zsh
    echo "Done!"
else
    echo "Skipping zsh config..."
fi

echo "Dost thou desire to install bash config files? (y/n)"
read -s -n 1 answer
while [ "$answer" != "y" -a "$answer" != "n" ]
do
    echo "Please answer with y or n."
    read -s -n 1 answer
done
if [ "$answer" == "y" ]
then
    echo "Installing bash config files..."
    localrc .bashrc
    ln -s $DIR/.bashrc ~/.bashrc
    echo "Done!"
else
    echo "Skipping bash config..."
fi

echo "Dost thou desire to install Xresources? (y/n)"
read -s -n 1 answer
while [ "$answer" != "y" -a "$answer" != "n" ]
do
    echo "Please answer with y or n."
    read -s -n 1 answer
done
if [ "$answer" == "y" ]
then
    echo "Installing Xresources..."
    backup .Xresources
    ln -s $DIR/.Xresources ~/.Xresources
    echo "Done!"
else
    echo "Skipping Xresources..."
fi

echo "Dost thou desire to install vim config files? (y/n)"
read -s -n 1 answer
while [ "$answer" != "y" -a "$answer" != "n" ]
do
    echo "Please answer with y or n."
    read -s -n 1 answer
done
if [ "$answer" == "y" ]
then
    echo "Installing vim config files..."
    backup .vim
    localrc .vimrc
    ln -s $DIR/.vimrc ~/.vimrc
    ln -s $DIR/.vim ~/.vim

    backup .config/powerline
    ln -s $DIR/.config/powerline ~/.config/powerline
    echo "Done!"

    echo "Installing vim plugins..."

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

else
    echo "Skipping vim config..."
fi

echo "Done! Thine terminal emulator might require a restart for the changes to take effect."

