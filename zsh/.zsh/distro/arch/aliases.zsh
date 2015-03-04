alias dmesg='dmesg -HL'

if [ $UID -ne 0 ]; then
    alias reboot='sudo systemctl reboot'
    alias poweroff='sudo systemctl poweroff'
    alias shutdown='sudo systemctl poweroff'
fi

## Yaourt aliases ## {{{
# if necessary, replace 'yaourt' with your favorite AUR helper and adapt the
# commands accordingly, requires aur-git package

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

# '[s]earch [i]nstalled packages' - requires an argument
alias pacsi="yaourt -Q | grep"

# update all *-git packages
alias pacugit="yaourt --noconfirm -S \$(yaourt -Q | grep '\-git' | sed 's/.*\/\([^ ]* \).*/\1/' | tr -d '\n')"

alias reflect="/usr/bin/reflector --latest 30 --number 20 --sort rate --save /etc/pacman.d/mirrorlist"

# }}}
