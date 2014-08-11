prompt() {

    RETVAL=$?

    user=`whoami`

    if ! [ $RETVAL -eq 0 ]; then
        status="${bg_red}${fg_white} $RETVAL ${fg_red}"
    else
        status=""
    fi

    if [ -n "$SSH_CLIENT" ]; then
        if [ -z "$status" ]; then
            ssh="${bg_grey}${fg_white}  \h ${fg_grey}"
        else
            ssh="${bg_grey}${fg_white}  \h ${fg_grey}"
        fi
    fi

    if [ "$user" == "root" ]; then
        if [ -n "$ssh" ]; then
            user="${bg_red}${fg_white} $user ${fg_red}"
        else
            user="${bg_red}${fg_white} $user ${fg_red}"
        fi
    else
        if [ -n "$ssh" ]; then
            user="${bg_green}${fg_white} $user ${fg_green}"
        else
            user="${bg_green}${fg_white} $user ${fg_green}"
        fi
    fi

    PS1="$status$ssh$user"
}

export PROMPT_COMMAND="prompt"
