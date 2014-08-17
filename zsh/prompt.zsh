autoload -U colors add-zsh-hook && colors

PROMPT_TEXT_COLOR="white"
PROMPT_SSH_COLOR="grey"
PROMPT_ROOTUSER_COLOR="red"
PROMPT_NORMALUSER_COLOR="green"
PROMPT_DIR_COLOR="grey"

PROMPT_GITCLEAN_COLOR="grey"
PROMPT_GITDIRTY_COLOR="yellow"
PROMPT_COMMANDFAIL_COLOR="red"
PROMPT_COMMANDSUCCES_COLOR="green"

prompt_setup() {

    RETVALS=$pipestatus

    setopt noxtrace localoptions prompt_subst

    local user
    local host
    local gitcolor
    local gitstring
    local userstring
    local usercolor
    local ref
    local dirty
    local git
    local errorcode
    local dir
    local printerrorcodes="false"
    local previous="none"

    user=`whoami`

    if [ "$user" = "root" ]; then
        usercolor=$PROMPT_ROOTUSER_COLOR
    else
        usercolor=$PROMPT_NORMALUSER_COLOR
    fi

    if [ -n "$SSH_CLIENT" ]; then
        host="%{$bg[$PROMPT_SSH_COLOR]$fg[$PROMPT_TEXT_COLOR]%}  %m %{$bg[$usercolor]$fg[$PROMPT_SSH_COLOR]%}"
    fi

    userstring="$host%{$bg[$usercolor]$fg[$PROMPT_TEXT_COLOR]%B%} %n %{%b$reset_color$fg[$usercolor]$bg[$PROMPT_DIR_COLOR]%}%{$reset_color%}"

    if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
        gitbranch=`git symbolic-ref HEAD 2>/dev/null | sed "s/refs\/heads\///"`
        gitchangedfiles=`git diff --name-status | sed "s/^\(.\)/\1/"`
        gitstagedfiles=`git diff --staged --name-status | sed "s/^\(.\)/\1/"`

        gitnumchanged=`echo -n $gitchangedfiles | grep -v "U" | wc -l`
        gitnumconflicts=`echo -n $gitstagedfiles | grep "U" | wc -l`
        gitnumstaged=`echo -n $gitstagedfiles | grep -v "U" | wc -l`
        gitnumuntracked=`git exec git ls-files --others --exclude-standard | wc -l`

        if [ $gitnumchanged -gt 0 -o $gitnumconflicts -gt 0 -o $gitnumstaged -gt 0 -o $gitnumuntracked -gt 0 ]
        then
            clean="false"
        else
            clean="true"
        fi

        if [ -z "$gitbranch" ]; then
            gitbranch=`git rev-parse --short HEAD`
        else
            gitremotename=`git config branch.$gitbranch.remote 2>/dev/null`
            if [ -n "$gitremotename" ]; then
                gitmergename=`git config branch.$gitbranch.merge 2>/dev/null`
                if [ $gitremotename = "." ]; then
                    gitremoteref=$gitmergename
                else
                    gitremoteref="refs/remotes/$gitremotename/$(echo $gitmergename | sed "s/refs\/heads\///")"
                fi
                gitrevlist=`git rev-list --left-right $gitremoteref...HEAD 2>/dev/null`
                if [ $? -ne 0 ]; then
                    gitrevlist=`git rev-list --left-right $gitmergename...HEAD 2>/dev/null`
                fi
                gitnumcommitsahead=`echo $gitrevlist | grep "^>" | wc -l`
                gitnumcommitsbehind=`echo $gitrevlist | grep "^<" | wc -l`
            fi
        fi


        if [ $clean = "true" ]; then
            gitcolor=$PROMPT_GITCLEAN_COLOR
            gitstring=""
            [ -n "$gitnumcommitsahead" ] && [ $gitnumcommitsahead -gt 0 ] && gitstring="$gitstring${gitnumcommitsahead}↑"
            [ -n "$gitnumcommitsbehind" ] && [ $gitnumcommitsbehind -gt 0 ] && gitstring="$gitstring${gitnumcommitsbehind}↓"
        else
            gitcolor=$PROMPT_GITDIRTY_COLOR
            gitstring=""
            [ $gitnumchanged -gt 0 ] && gitstring="${gitnumchanged}±"
            [ $gitnumstaged -gt 0 ] && gitstring="$gitstring${gitnumstaged}✔"
            [ $gitnumconflicts -gt 0 ] && gitstring="$gitstring${gitnumconflicts}✘"
            [ $gitnumuntracked -gt 0 ] && gitstring="$gitstring${gitnumuntracked}…"
            [ -n "$gitnumcommitsahead" ] && [ $gitnumcommitsahead -gt 0 ] && gitstring="$gitstring${gitnumcommitsahead}↑"
            [ -n "$gitnumcommitsbehind" ] && [ $gitnumcommitsbehind -gt 0 ] && gitstring="$gitstring${gitnumcommitsbehind}↓"
        fi

        if [ -z "$gitstring" ]; then
            git="%{$fg[$gitcolor]%}%{$bg[$gitcolor]$fg[$PROMPT_TEXT_COLOR]%B%}  $gitbranch %{%b$reset_color%}"
        else
            git="%{$fg[$gitcolor]%}%{$bg[$gitcolor]$fg[$PROMPT_TEXT_COLOR]%B%}  $gitbranch $gitstring %{%b$reset_color%}"
        fi
    fi

    for RETVAL in $(echo $RETVALS | sed "s/ /\n/g"); do
        if [ "$RETVAL" != "0" ]; then
            printerrorcodes="true"
            if [ "$previous" = "none"  ]; then
                if [ -n "$git" ]; then
                    errorcode="%{$reset_color$bg[$gitcolor]$fg[$PROMPT_COMMANDFAIL_COLOR]%}%{$fg[$PROMPT_TEXT_COLOR]$bg[$PROMPT_COMMANDFAIL_COLOR]%B%} $RETVAL %{%b$reset_color%}"
                else
                    errorcode="%{$reset_color$fg[$PROMPT_COMMANDFAIL_COLOR]%}%{$fg[$PROMPT_TEXT_COLOR]$bg[$PROMPT_COMMANDFAIL_COLOR]%B%} $RETVAL %{%b$reset_color%}"
                fi
            elif [ "$previous" != "0" ]; then
                errorcode="$errorcode%{$fg[$PROMPT_TEXT_COLOR]$bg[$PROMPT_COMMANDFAIL_COLOR]%}%{$fg[$PROMPT_TEXT_COLOR]$bg[$PROMPT_COMMANDFAIL_COLOR]%B%} $RETVAL %{%b$reset_color%}"
            else
                errorcode="$errorcode%{$fg[$PROMPT_COMMANDFAIL_COLOR]$bg[$PROMPT_COMMANDSUCCES_COLOR]%}%{$fg[$PROMPT_TEXT_COLOR]$bg[$PROMPT_COMMANDFAIL_COLOR]%B%} $RETVAL %{%b$reset_color%}"
            fi
        else
            if [ "$previous" = "none"  ]; then
                if [ -n "$git" ]; then
                    errorcode="%{$reset_color$bg[$gitcolor]$fg[$PROMPT_COMMANDSUCCES_COLOR]%}%{$fg[$PROMPT_TEXT_COLOR]$bg[$PROMPT_COMMANDSUCCES_COLOR]%B%} $RETVAL %{%b$reset_color%}"
                else
                    errorcode="%{$reset_color$fg[$PROMPT_COMMANDSUCCES_COLOR]%}%{$fg[$PROMPT_TEXT_COLOR]$bg[$PROMPT_COMMANDSUCCES_COLOR]%B%} $RETVAL %{%b$reset_color%}"
                fi
            elif [ "$previous" != "0" ]; then
                errorcode="$errorcode%{$fg[$PROMPT_COMMANDSUCCES_COLOR]$bg[$PROMPT_COMMANDFAIL_COLOR]%}%{$fg[$PROMPT_TEXT_COLOR]$bg[$PROMPT_COMMANDSUCCES_COLOR]%B%} $RETVAL %{%b$reset_color%}"
            else
                errorcode="$errorcode%{$fg[$PROMPT_TEXT_COLOR]$bg[$PROMPT_COMMANDSUCCES_COLOR]%}%{$fg[$PROMPT_TEXT_COLOR]$bg[$PROMPT_COMMANDSUCCES_COLOR]%B%} $RETVAL %{%b$reset_color%}"
            fi
        fi
        previous=$RETVAL
    done
    if [ $printerrorcodes = "false" ]; then
        errorcode=""
    fi

    dir=`pwd | sed "s#$HOME#/~#" | sed "s#^/##" \
        | sed "s/\([^/]*\)$/%{%B%}\1%{%b%}/" \
        | sed "s/.*\(\/[^/]*\/[^/]*\/[^/]*\)/⋯\1/" \
        | sed "s/^/%{$bg[$PROMPT_DIR_COLOR]$fg[$PROMPT_TEXT_COLOR]%} /" \
        | sed "s/\// %{$fg[$PROMPT_TEXT_COLOR]%}%{$fg[$PROMPT_TEXT_COLOR]%} /g" \
        | sed "s/$/%{$bg[$PROMPT_DIR_COLOR]%} %{$reset_color$fg[$PROMPT_DIR_COLOR]%}%{$reset_color%}/"`

    if [ "$(pwd)" = "/" ]; then
        dir="%{$bg[$PROMPT_DIR_COLOR]$fg[$PROMPT_TEXT_COLOR]%B%} / %{%b$reset_color$fg[$PROMPT_DIR_COLOR]%}%{$reset_color%}"
    fi

    PROMPT="$userstring$dir "
    RPROMPT="$git$errorcode"

}

add-zsh-hook precmd prompt_setup
