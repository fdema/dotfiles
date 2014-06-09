# requires "pkgfile" package
if [ -f /usr/share/doc/pkgfile/command-not-found.zsh ]
then
    source /usr/share/doc/pkgfile/command-not-found.zsh
fi
# requires "zsh-syntax-highlighting" package
if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]
then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

source ~/.zsh/distro/arch/aliases.zsh
