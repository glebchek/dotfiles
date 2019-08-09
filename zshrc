export GOPATH="$HOME/go"
export PATH="$HOME/.local/bin/:$GOPATH/bin:$HOME/.yarn/bin:$PATH"

setopt correctall
setopt HIST_IGNORE_DUPS
setopt menucomplete

autoload -Uz promptinit
promptinit

#Persistent rehash
zstyle ':completion:*' rehash true
zstyle ':completion:*' menu select=1 _complete _ignored _approximate
#Enable colors
autoload -U colors && colors

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/gleb/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2) tar xvjf $1   ;;
      *.tar.gz)  tar xvzf $1   ;;
      *.tar.xz)  tar xvfJ $1   ;;
      *.bz2)     bunzip2 $1    ;;
      *.rar)     unrar x $1    ;;
      *.gz)      gunzip $1     ;;
      *.tar)     tar xvf $1    ;;
      *.tbz2)    tar xvjf $1   ;;
      *.tgz)     tar xvzf $1   ;;
      *.zip)     unzip $1      ;;
      *.Z)       uncompress $1 ;;
      *.7z)      7z x $1       ;;
      *)         echo "'$1' cannot be extracted via >extract<" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

#####Powerline
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_MODE='default'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(ssh root_indicator context dir node_version vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(background_jobs ram disk_usage status time)
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M %d.%m}"
POWERLEVEL9K_CONTEXT_TEMPLATE="\uF109 %n@%m"
#####

source ~/.zplug/init.zsh

zplug "zsh-users/zsh-syntax-highlighting"
zplug "bhilburn/powerlevel9k", as:theme

if ! zplug check; then
    zplug install
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose
