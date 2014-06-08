setopt appendhistory autocd extendedglob nomatch
unsetopt beep notify
bindkey -e

autoload -U promptinit
promptinit

case $TERM in
  (*xterm* | *rxvt*)

    # Write some info to terminal title.
    # This is seen when the shell prompts for input.
    function precmd {
      print -Pn "\e]0;$USER@$HOST - $PWD\a"
    }
    # Write command and args to terminal title.
    # This is seen while the shell waits for a command to complete.
    function preexec {
      printf "\e]0;%s\a" "$1"
    }

  ;;
esac
