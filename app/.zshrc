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

# Prompt
src=$(brew --prefix git)/etc/bash_completion.d/git-prompt.sh
setopt prompt_subst

if [ -f $src ]; then
	. $src
	PROMPT="%n@%m %~ \$(__git_ps1) %# "
else
	PROMPT='%n@%m %~ %# '
fi
