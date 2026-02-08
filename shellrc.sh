# Use Homebrew git (2x faster than Apple's)
export PATH="/usr/local/bin:$PATH"

# Initialize gitstatus for super fast git prompt
if [[ -n "$ZSH_VERSION" ]]; then
    # Zsh
    if [[ -f /usr/local/opt/gitstatus/gitstatus.plugin.zsh ]]; then
        source /usr/local/opt/gitstatus/gitstatus.plugin.zsh
        gitstatus_start MY
    fi
elif [[ -n "$BASH_VERSION" ]]; then
    # Bash
    if [[ -f /usr/local/opt/gitstatus/gitstatus.plugin.sh ]]; then
        source /usr/local/opt/gitstatus/gitstatus.plugin.sh
        gitstatus_stop 2>/dev/null
        gitstatus_start -s -1 -u -1 -c -1 -d -1
    fi
fi

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
source ~/dotfiles/aliases.sh
# Functions
source ~/dotfiles/functions.sh
# Colors
source ~/dotfiles/colors.sh
# Git prompt
source ~/dotfiles/git_prompt.sh
