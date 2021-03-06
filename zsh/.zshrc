## TMUX
#if [[ -z "$TMUX" ]]; then
#    if tmux -q has-session; then
#        exec tmux attach-session -d
#    else
#        exec tmux new-session -ndefault
#    fi
#fi
#
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

