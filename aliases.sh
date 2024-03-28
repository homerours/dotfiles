# VIM
alias svim="sudoedit"
# NeoVIM
 if type nvim > /dev/null 2>&1
 then
   alias vim='nvim'
 fi

#LS
alias ls='ls -p --color=always'
alias sl='ls'
alias l='ls'
alias la='ls -lah'

# OPEN
#alias open='xdg-open'

# arch
alias pacS='sudo pacman -S'
alias pacR='sudo pacman -Rscn'
alias pacSyu='sudo pacman -Syu'
alias clean_cache='sudo pacman -Scc'
alias remove_orphans='sudo pacman -Rns $(pacman -Qtdq)'

# Disk usage
alias dul="du -h -d 1"

# parent directory
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'

# tree
alias t='tree -L 1'
alias tt='tree -L 2'
alias ttt='tree -L 3'
alias tttt='tree -L 4'
alias ttttt='tree -L 5'
