# TMUX
if which tmux >/dev/null 2>&1; then
    # if no session is started, start a new session
    test -z ${TMUX} && tmux

    # when quitting tmux, try to attach
    while test -z ${TMUX}; do
        tmux attach || break
    done
fi

# Find out distro
DISTRO=$(cat /etc/*-release | grep "^ID=" | sed "s/^ID=//") 2>/dev/null

source ~/.zsh/completion.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/variables.zsh
source ~/.zsh/options.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/prompt.zsh

# For distro-specific settings, variables, aliases, ...
if [ -f ~/.zsh/distro/$DISTRO/sources.zsh ]; then
    source ~/.zsh/distro/$DISTRO/sources.zsh
fi

# For user-specific settings, variables, aliases, ...
if [ -f ~/.zsh/user/$USER/sources.zsh ]
then
    source ~/.zsh/user/$USER/sources.zsh
fi

# For machine-specific settings, variables, aliases, ...
if [ -f ~/.zshrc.local ]
then
    source ~/.zshrc.local
fi

