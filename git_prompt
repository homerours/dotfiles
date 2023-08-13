#!/bin/bash
git_dirty () {
	[[ -n $(git status --porcelain 2> /dev/null)  ]] && echo '!'
}
git_branch () {
    git rev-parse --abbrev-ref HEAD
}
git_prompt(){
    if [[ -n $(git branch 2> /dev/null) ]] 
    then
        echo -e "${BASE0} on ${GREEN}$(git_branch)${MAGENTA}$(git_dirty)${RESET}"
    fi
}
