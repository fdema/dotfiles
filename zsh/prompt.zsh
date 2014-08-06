autoload -U colors add-zsh-hook && colors


prompt_setup() {

    RETVALS=$pipestatus

    setopt noxtrace localoptions prompt_subst

    local user
    local userstring
    local usercolor
    local errorcode
    local dir
    local printerrorcodes="false"
    local previous="none"

    user=`whoami`

    if [ "$user" = "root" ]; then
        usercolor="red"
    else
        usercolor="green"
    fi 

    userstring="%{$bg[$usercolor]$fg[white]%B%} %n %{%b$reset_color$fg[$usercolor]$bg[grey]%}%{$reset_color%}"

    for RETVAL in $(echo $RETVALS | sed "s/ /\n/g"); do
        if [ "$RETVAL" != "0" ]; then
            printerrorcodes="true"
            if [ "$previous" = "none"  ]; then
                errorcode="%{$reset_color$fg[red]%}%{$fg[white]$bg[red]%B%} $RETVAL %{%b$reset_color%}"
            elif [ "$previous" != "0" ]; then
                errorcode="$errorcode%{$fg[white]$bg[red]%}%{$fg[white]$bg[red]%B%} $RETVAL %{%b$reset_color%}"
            else
                errorcode="$errorcode%{$fg[red]$bg[green]%}%{$fg[white]$bg[red]%B%} $RETVAL %{%b$reset_color%}"
            fi
        else
            if [ "$previous" = "none"  ]; then
                errorcode="%{$reset_color$fg[green]%}%{$fg[white]$bg[green]%B%} $RETVAL %{%b$reset_color%}"
            elif [ "$previous" != "0" ]; then
                errorcode="$errorcode%{$fg[green]$bg[red]%}%{$fg[white]$bg[green]%B%} $RETVAL %{%b$reset_color%}"
            else
                errorcode="$errorcode%{$fg[white]$bg[green]%}%{$fg[white]$bg[green]%B%} $RETVAL %{%b$reset_color%}"
            fi
        fi
        previous=$RETVAL
    done
    if [ $printerrorcodes = "false" ]; then
        errorcode=""
    fi

    dir=`pwd | sed "s/^\///" | sed "s/home\/$user/~/" \
        | sed "s/\([^/]*\)$/%{%B%}\1%{%b%}/" \
        | sed "s/.*\(\/[^/]*\/[^/]*\/[^/]*\)/⋯\1/" \
        | sed "s/^/%{$bg[grey]$fg[white]%} /" \
        | sed "s/\// %{$fg[white]%}%{$fg[white]%} /g" \
        | sed "s/$/%{$bg[grey]%} %{$reset_color$fg[grey]%}%{$reset_color%}/"`

    PROMPT="$userstring$dir "
    RPROMPT="$errorcode"

}

add-zsh-hook precmd prompt_setup
