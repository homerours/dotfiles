#!/bin/bash

git_prompt(){
    # Try gitstatus first (if available and functions are loaded)
    if type gitstatus_query &>/dev/null; then
        # Bash: no name parameter, zsh: requires 'MY' name parameter
        if [[ -n "$BASH_VERSION" ]]; then
            gitstatus_query -d "$PWD" || return
        else
            gitstatus_query MY || return
        fi

        local branch="$VCS_STATUS_LOCAL_BRANCH"
        [[ -z "$branch" ]] && branch="${VCS_STATUS_COMMIT:0:7}"

        local dirty=""
        # Check if there are any changes (staged, unstaged, or untracked)
        if [[ "$VCS_STATUS_HAS_STAGED" == "1" ]] ||
           [[ "$VCS_STATUS_HAS_UNSTAGED" == "1" ]] ||
           [[ "$VCS_STATUS_HAS_UNTRACKED" == "1" ]]; then
            dirty="!"
        fi

        echo -e "${BASE0} on ${GREEN}${branch}${MAGENTA}${dirty}${RESET}"
        return
    fi

    # Fallback to manual git commands
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

    # Fast dirty check
    local dirty=""
    if [[ -n $(git status --porcelain 2>/dev/null | head -1) ]]; then
        dirty="!"
    fi

    echo -e "${BASE0} on ${GREEN}${branch}${MAGENTA}${dirty}${RESET}"
}
