## Modified commands ## {{{
alias diff='colordiff'              # requires colordiff package
alias grep='grep --color=auto'
alias more='less'
alias df='df -h'
alias du='du -c -h'
alias mkdir='mkdir -p -v'
alias nano='nano -w'
alias ping='ping -c 5'
alias dmesg='dmesg -HL'
# }}}

## New commands ## {{{
alias da='date "+%A, %B %d, %Y [%T]"'
alias du1='du --max-depth=1'
alias hist='history | grep'         # requires an argument
alias openports='ss --all --numeric --processes --ipv4 --ipv6'
alias pgg='ps -Af | grep'           # requires an argument
alias ..='cd ..'
# }}}

# Privileged access
if [ $UID -ne 0 ]; then
    alias sudo='sudo '
    alias scat='sudo cat'
    alias svim='sudoedit'
    alias root='sudo -s'
    alias reboot='sudo systemctl reboot'
    alias poweroff='sudo systemctl poweroff'
fi

## ls ## {{{
alias ls='ls -hF --color=auto'
alias lr='ls -R'                    # recursive ls
alias ll='ls -l'
alias la='ll -A'
alias lx='ll -BX'                   # sort by extension
alias lz='ll -rS'                   # sort by size
alias lt='ll -rt'                   # sort by date
alias lm='la | more'
# }}}

## Safety features ## {{{
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -I'                    # 'rm -i' prompts for every file

# safer alternative w/ timeout, not stored in history
alias rm=' timeout 3 rm -Iv --one-file-system'
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
alias cls=' echo -ne "\033c"'       # clear screen for real (it does not 
                                    # work in Terminology)
# }}}

## Make zsh error tolerant ## {{{
alias :q=' exit'
alias :Q=' exit'
alias :x=' exit'
alias cd..='cd ..'
# }}}

## Yaourt aliases ## {{{
# if necessary, replace 'yaourt' with your favorite AUR helper and adapt the
# commands accordingly

# default action - install one or more packages
alias pac="yaourt -S"			

# '[u]pdate' - upgrade all packages to their newest version
alias pacu="sudo aur; yaourt -Syau"

# '[r]emove' - uninstall one or more packages
alias pacr="yaourt -Rns"		

# '[s]earch' - search for a package using one or more keywords
alias pacs="yaourt -Ss"			

# '[i]nfo' - show information about a package
alias paci="yaourt -Si"			

# '[l]ist [o]rphans' - list all packages which are orphaned
alias paclo="yaourt -Qdt"		

# '[c]lean cache' - delete all not currently installed package files
alias pacc="yaourt -Scc"		

# '[l]ist [f]iles' - list all files installed by a given package
alias paclf="yaourt -Ql"		

# 'mark as [expl]icit' - mark one or more packages as explicitly installed
alias pacexpl="yaourt -D --asexp"	 

# 'mark as [impl]icit' - mark one or more packages as non explicitly installed
alias pacimpl="yaourt -D --asdep"	

# '[r]emove [o]rphans' - recursively remove ALL orphaned packages
alias pacro="yaourt -Qtdq > /dev/null && yaourt -Rns \$(yaourt -Qtdq | sed -e ':a;N;$!ba;s/\n/ /g')"

# update all *-git packages
alias pacugit="yaourt --noconfirm -S $(yaourt -Q | grep '\-git' | sed 's/.*\/\([^ ]* \).*/\1/' | tr -d '\n')"

# }}}
