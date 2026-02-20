source ~/dotfiles/shellrc.sh
# Jumper
eval "$(jumper shell bash)"

# Bash History Options
export HISTSIZE=1000000
export HISTCONTROL='ignoreboth'
export HISTIGNORE='&:ls:[bf]g:exit'
export HISTTIMEFORMAT='%b %d %H:%M:%S: '

shopt -s histappend
shopt -s cmdhist
export PROMPT_COMMAND="history -a;${PROMPT_COMMAND}"

shopt -s checkwinsize
shopt -s cdspell

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"
bind -x '"\C-p": "fzf-file-widget"'

PS1="${MAGENTA}\u${BASE0}@${YELLOW}\h${BASE0}|${CYAN}\w${BASE0}\$(git_prompt)${RESET}\n\$ "
