# Colors in man
man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
        LESS_TERMCAP_md=$'\E[01;38;5;74m' \
        LESS_TERMCAP_me=$'\E[0m' \
        LESS_TERMCAP_se=$'\E[0m' \
        LESS_TERMCAP_so=$'\E[38;5;246m' \
        LESS_TERMCAP_ue=$'\E[0m' \
        LESS_TERMCAP_us=$'\E[04;38;5;146m' \
        man "$@"
}

# Extract zips, tar.gzs, ...
extract() {
    local c e i

    (($#)) || return

    for i; do
        c=''
        e=1

        if [[ ! -r $i ]]; then
            echo "$0: file is unreadable: \`$i'" >&2
            continue
        fi

        case $i in
            *.t@(gz|lz|xz|b@(2|z?(2))|a@(z|r?(.@(Z|bz?(2)|gz|lzma|xz)))))
                c=(bsdtar xvf);;

            *.7z)
                c=(7z x);;

            *.Z)
                c=(uncompress);;
            *.bz2)
                c=(bunzip2);;
            *.exe)
                c=(cabextract);;
            *.gz)
                c=(gunzip);;
            *.rar)
                c=(unrar x);;
            *.xz)
                c=(unxz);;
            *.zip)
                c=(unzip);;
            *)
                echo "$0: unrecognized file extension: \`$i'" >&2
                continue;;
        esac

        command "${c[@]}" "$i"
        ((e = e || $?))
    done
    return "$e"
}