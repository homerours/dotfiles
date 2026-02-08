# Use Homebrew git (2x faster than Apple's)
export PATH="/usr/local/bin:$PATH"

# Initialize gitstatus for super fast git prompt
if [[ -f /usr/local/opt/gitstatus/gitstatus.plugin.sh ]]; then
    source /usr/local/opt/gitstatus/gitstatus.plugin.sh
    gitstatus_stop 2>/dev/null
    gitstatus_start -s -1 -u -1 -c -1 -d -1
fi

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

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"
bind -x '"\C-p": "fzf-file-widget"'

PS1="${MAGENTA}\u${BASE0}@${YELLOW}\h${BASE0}|${CYAN}\w${BASE0}\$(git_prompt)${RESET}\n\$ "
