# Install a package
alias apti='sudo apt-get install'
# Update all packages
alias aptu='sudo apt-get update && sudo apt-get upgrade'
# Update packages with possible removals (no explicitely installed packages 
# without prompt)
alias aptdu='sudo apt-get update && sudo apt-get dist-upgrade'
# Autoremove all unneeded packages (not installed explicitely or a dependency
# of an explicitely installed package
alias aptar='sudo apt-get autoremove'
# Searh packages
alias apts='sudo apt-cache search'
