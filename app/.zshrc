# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/Users/narvin/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


################################################################################
#                                    Prompt
################################################################################
setopt prompt_subst

src=$(brew --prefix git)/etc/bash_completion.d/git-prompt.sh
hasgitps1=0

if [ -f $src ]; then
  . $src
  hasgitps1=1
fi

precmd () {
  RED=124
  GREEN=028
  BLUE=057
  PURPLE=129
  WHITE=242
  mainPart='%F{$RED}%n%F{$WHITE}@%F{$GREEN}%m %F{$BLUE}%~%f'

  if [ $hasgitps1 ]; then
    gitPart='%F{$PURPLE}\$(__git_ps1 " [%s]")%f'
  else
    gitPart=''
  fi

  print -P "${mainPart}${gitPart}"
}
