# Find out distro
DISTRO=$(cat /etc/*-release | grep "^ID=" | sed "s/^ID=//")

source ~/.zsh/completion.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/variables.zsh
source ~/.zsh/options.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/addons.zsh

source ~/.zsh/distro/$DISTRO/sources.zsh

# For user-specific settings, variables, ...
source ~/.zshrc.local
