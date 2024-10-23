source ~/dotfiles/shellrc.sh
# Jumper
# export __JUMPER_FOLDERS=~/folders
# __JUMPER_FZF_FILES_PREVIEW='cat'
# source ~/Documents/dev/jumper/shell/jumper.bash
eval "$(jumper shell bash)"

# Terminal Colors
export CLICOLOR=1

# Bash History Options
export HISTSIZE=1000000
export HISTCONTROL='ignoreboth'
export HISTIGNORE='&:ls:[bf]g:exit'
export HISTTIMEFORMAT='%b %d %H:%M:%S: '

shopt -s histappend
set cmdhist
export PROMPT_COMMAND="history -a; history -c; history -r;${PROMPT_COMMAND}"

shopt -s checkwinsize
shopt -s cdspell

# FZF fuzzy finder
if [ -f ~/.fzf.bash ]; then
	source ~/.fzf.bash
	bind -x '"\C-p": "fzf-file-widget"'
fi

PS1="${MAGENTA}\u${BASE0}@${YELLOW}\h${BASE0}|${CYAN}\w${BASE0}\$(git_prompt)${RESET}\n\$ "
