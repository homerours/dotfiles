# Use Homebrew git (2x faster than Apple's)
export PATH="/usr/local/bin:$PATH"

source ~/dotfiles/shellrc.sh
# Jumper
source <(jumper shell zsh)

# Case-insensitive completion on mac
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
#
# VIM MODE
bindkey -v
bindkey jk vi-cmd-mode 

bindkey '\e[Z' reverse-menu-complete

# append + share history
setopt inc_append_history
setopt share_history

# Prepend sudo to a command
function run-with-sudo()
{
	LBUFFER="sudo $LBUFFER"
}

zle -N run-with-sudo
bindkey '^Xs' run-with-sudo 

setopt PROMPT_SUBST
PROMPT='%F{magenta}%n%F{base}@%F{yellow}%m%F{blue}|%F{green}%~%F{base}$(git_prompt)
$ '

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
zle     -N   fzf-file-widget
bindkey '^P' fzf-file-widget
