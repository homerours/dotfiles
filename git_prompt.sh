#!/bin/bash
git_prompt(){
    # Check if in git repo (using shell builtin test)
    [[ -d .git ]] || git rev-parse --git-dir &>/dev/null || return

    # Read branch directly from .git/HEAD (no fork/exec!)
    local branch=""
    if [[ -f .git/HEAD ]]; then
        read -r head_content < .git/HEAD
        if [[ "$head_content" == ref:* ]]; then
            branch="${head_content#ref: refs/heads/}"
        else
            branch="${head_content:0:7}"  # detached HEAD
        fi
    else
        return
    fi

    # Fast dirty check: compare index modification time with working tree
    # This is approximate but very fast
    local dirty=""
    if [[ -n $(git status --porcelain 2>/dev/null | head -1) ]]; then
        dirty="!"
    fi

    echo -e "${BASE0} on ${GREEN}${branch}${MAGENTA}${dirty}${RESET}"
}
