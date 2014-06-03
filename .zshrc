# Source the file(s) if it exists
function loadfile() {
    if [ $# -lt 1 ]
    then
        return;
    fi
    for file in $@
    do
        if [ -f "$file" ]
        then
            source $file
        fi
    done
}

# Find out distro
DISTRO=$(cat /etc/*-release | grep "^ID=" | sed "s/^ID=//")

source ~/.zsh/completion.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/variables.zsh
source ~/.zsh/options.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/addons.zsh

# For distro-specific settings, variables, aliases, ...
loadfile ~/.zsh/distro/$DISTRO/sources.zsh

# For user-specific settings, variables, aliases, ...
loadfile ~/.zsh/user/$USER/sources.zsh

# For machine-specific settings, variables, aliases, ...
loadfile ~/.zshrc.local
