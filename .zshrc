# Find out distro
DISTRO=$(cat /etc/*-release | grep "^ID=" | sed "s/^ID=//")

source ~/.zsh/completion.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/variables.zsh
source ~/.zsh/options.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/addons.zsh

# For distro-specific settings, variables, ...
if [ -f ~/.zsh/distro/$DISTRO/sources.zsh ]
then
    source ~/.zsh/distro/$DISTRO/sources.zsh
fi

# For user-specific settings, variables, ...
if [ -f ~/.zsh/user/$USER/sources.zsh ]
then
    source ~/.zsh/user/$USER/sources.zsh
fi

# For machine-specific settings, variables, ...
if [ -f ~/.zshrc.local ]
then
    source ~/.zshrc.local
fi
