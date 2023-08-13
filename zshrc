#export TERM=xterm-256color
source ~/dotfiles/shellrc.sh

# VIM MODE
bindkey -v
bindkey jk vi-cmd-mode 

bindkey '\e[Z' reverse-menu-complete

zle -N run-with-sudo
bindkey '^Xs' run-with-sudo 

setopt PROMPT_SUBST
PROMPT='%F{magenta}%n%F{base}@%F{yellow}%m%F{blue}|%F{green}%~%F{base}$(git_prompt)
$ '

# Fuzzy finder
if [ -f ~/.fzf.zsh ]
then
	zle     -N   fzf-file-widget
	bindkey '^P' fzf-file-widget
	source ~/.fzf.zsh
fi
