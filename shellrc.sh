#export TERM=xterm-256color
#eval `dircolors ~/.dircolors.ansi-dark`
#eval `dircolors ~/.dircolors.256dark`
#eval `dircolors ~/.dircolors.ansi-universal`
export CLICOLOR=1
export LSCOLORS="hx"

# VIM as default
if type nvim > /dev/null 2>&1
then
  editor='nvim'
else
  editor='vim'
fi
export EDITOR="$editor"
export SUDO_EDITOR="$editor"
export GIT_EDITOR="$editor"

# Aliases
source ~/dotfiles/aliases
# Functions
source ~/dotfiles/functions
# Colors
source ~/dotfiles/colors.sh
# Git prompt
source ~/dotfiles/git_prompt

# include Z
. ~/dotfiles/z.sh
