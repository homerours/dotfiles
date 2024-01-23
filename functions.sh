# FZF
function ff() {
    RG_PREFIX='rg -i --column --line-number --color=always '
    INITIAL_QUERY=''
    fzf --ansi --disabled --query "$INITIAL_QUERY" \
    --bind "start:reload:$RG_PREFIX {q}" \
    --bind "change:reload:sleep 0.1; $RG_PREFIX {q} || true" \
    --delimiter : \
    --preview 'bat --color=always {1} --highlight-line {2}' \
    --preview-window 'up,60%,border-bottom,+{2}+3/3,~3' \
    --bind 'enter:become(nvim {1} +{2})'
}

function cc() {
    cd $(fd --type directory | fzf)
}

# Tmux
function __session_name() {
    session=$1
    suffix=0
    tmux has-session -t $session 2>/dev/null
    while [[ $? == 0 ]]; do
        suffix=$((suffix+1))
        session="${1}${suffix}"
        tmux has-session -t $session 2>/dev/null
    done
    echo $session
}

function __switch_session() {
    if [[ -z $TMUX ]]; then
        tmux attach -t "$1"
    else
        tmux switch-client -t "$1"
    fi
}

function tn() {
    name=$1
    [[ ! -z $name ]] || name='session'
    name=$(__session_name $name)
    tmux new-session -d -s "${name}"
    __switch_session "${name}"
}

function tz() {
    folder=$(jumper -f "${jumpfile}" -n 1 "$1")
    name=$(__session_name $(basename ${folder}))
    tmux new-session -d -s "${name}"
    tmux send-keys -t "${name}" "cd ${folder}" 'C-m' 'C-l'
    __switch_session "${name}"
}

# Create directory and move into
function mcd()
{
	mkdir -p $1 && cd $1
}

# move to ~/.Trash instead of rm a file
function del()
{
	for i in $* ; do
		mv $i ~/.local/share/Trash/files/
	done
}

# Compress pdf using Ghostscript
function pdf_compress()
{
	gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/printer -dNOPAUSE -dQUIET -dBATCH -sOutputFile=compressed_$1 $1
}

# Format pdf 2 pages per sheet and remove margins
# left, top, right and bottom margins
function pdf_sbs()
{
	pdfcrop --margins '0 0 0 0' $1 crop_$1;
	pdfnup --scale 1.00 --delta "-0.0cm 0cm -0cm 0cm" --outfile sbs_$1 crop_$1;
	rm crop_$1;
}
