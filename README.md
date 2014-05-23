dotfiles
========

How to install
--------------

###Basics

1.  Clone repo into directory of choice

2.  Make symlinks to necessary files 
    e.g. `$ ln -s ~/repos/dotfiles/.vimrc ~/.vimrc`

3.  Install vundle: `$ git clone https://github.com/gmarik/Vundle.vim.git ~/repos/dotfiles/.vim/bundle/Vundle.vim`

4.  Launch vim and execute `:PluginInstall` or `:BundleInstall`

5.  Done! (for powerline cfr infra)


###Powerline

After install with vundle, you still need to setup fonts and symbols.

1. Download [PowerlineSymbols.otf](https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf) and [10-powerline-symbols.conf](https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf)

2.  Move `PowerlineSymbols.otf` to `~/.fonts/` (or another X font directory).

3.  Run `fc-cache -vf ~/.fonts` to update your font cache.

4.  Move `10-powerline-symbols.conf` to either `~/.fonts.conf.d/` or `~/.config/fontconfig/conf.d/`, depending on your fontconfig version.
    When none of these directories is available do: `mkdir ~/.config/fontconfig/conf.d` and `ln -s ~/.config/fontconfig/conf.d/ ~/.fonts.conf.d` 

6.  Download patched fonts. 
    `$ cd ~/.fonts`
    `$ git clone git://github.com/Lokaltog/powerline-fonts.git`
    `$ fc-cache -vf`

5.  If you don’t see the arrow symbols, please close all instances of your terminal emulator or gvim. You may also have to restart X for the changes to take effect. If you still don’t see the arrow symbols, please submit an issue on GitHub.)


For more info check [here](http://powerline.readthedocs.org/en/latest/installation/linux.html).
