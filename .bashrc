#!/bin/sh


# File extractor
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# VSCODE - Insiders => Open defined file/folder or open current dir
ci ()
{
  if [ $1 ] ; then
    code-insiders $1
  else
    code-insiders .
  fi
}

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Custom Alias
alias brc='ci ~/.bashrc' # Open's .bashrc in nano
alias srcbrc='source ~/.bashrc' # Reloads the bashrc file
alias cls='clear' # cls clears like Windows
alias top='htop' # switch default top with htop
alias ll='ls -la' # add ll
alias ~='cd ~ && clear' # Add a wipe
alias ls='ls --color=auto'

# EOF #

##-----------------------------------------------------
## status
## Added by synth-shell
## https://github.com/andresgongora/synth-shell/
if [ -f /home/bryce/.config/synth-shell/status.sh ]; then
	source /home/bryce/.config/synth-shell/status.sh
fi

##-----------------------------------------------------
## fancy-bash-prompt
## Added by synth-shell
## https://github.com/andresgongora/synth-shell/
if [ -f /home/bryce/.config/synth-shell/fancy-bash-prompt.sh ]; then
	source /home/bryce/.config/synth-shell/fancy-bash-prompt.sh
fi

##-----------------------------------------------------
## better-ls
## Added by synth-shell
## https://github.com/andresgongora/synth-shell/
if [ -f /home/bryce/.config/synth-shell/better-ls.sh ]; then
	source /home/bryce/.config/synth-shell/better-ls.sh
fi

##-----------------------------------------------------
## alias
## Added by synth-shell
## https://github.com/andresgongora/synth-shell/
if [ -f /home/bryce/.config/synth-shell/alias.sh ]; then
	source /home/bryce/.config/synth-shell/alias.sh
fi
