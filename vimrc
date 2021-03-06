"   | | | (_)
"   | | | |_ _ __ ___  _ __ ___
"   | | | | | '_ ` _ \| '__/ __|
"   \ \_/ / | | | | | | | | (__
"    \___/|_|_| |_| |_|_|  \___|)

" My .vimrc

" PLUGINS
source ~/dotfiles/vimrc.plugins

set number        " afficher le numero des lignes
set tabstop=4     " number of visual spaces per tab
set softtabstop=4 " number of spaces per tab
set shiftwidth=4
set wrap          " wrap lines
set linebreak     " wrap long lines at a blank
set nolist
set nospell       " disable spell checking
set noswapfile    " no swap files are created
set lazyredraw    " only redraw when needed
set autoindent    " reproduit l'indentation de la ligne précédente
set hlsearch      " highlight search results
set incsearch     " cherche pendant qu'on tape
set numberwidth=1 " espaces pris par les numeros de ligne
set hidden        " buffer switching without saving
set scrolljump=5  " Lines to scroll when cursor leaves screen
set scrolloff=3   " Minimum lines to keep above and below cursor
set cursorline    " highlight current line
syntax enable     " coloration syntaxique

" Neovim cursor
set guicursor=

" avoid highlighting last search when sourcing vimrc
let @/ = ""

" Colorscheme
set t_Co=256
set background=dark
colorscheme solarized

" Disable auto comments
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" filetype-specific indentation
filetype indent on

" open file at the same line that it was closed for the last time
autocmd BufWinLeave ?* mkview
autocmd BufWinEnter ?* silent! loadview

" Leaders
let mapleader = ' '
let maplocalleader = 'ù'

" Exit insert mode
inoremap jk <c-o>:stopinsert<cr>

noremap j gj
noremap k gk

" ; at the end of the line
nnoremap <leader>; A;<Esc>

" Matching ( or ] ...
nnoremap à %

" Last edited line
nnoremap <leader>_ '.
" Last edited location
nnoremap <leader>ç `.

" highlight last inserted text
nnoremap gV `[v`]

" Remove search highlighting
nnoremap <leader>* :noh<cr>

" Sudo write
nnoremap <leader>W :w !sudo tee %<cr>

" Indent file
nnoremap <leader>f :normal gg=G''<cr>zz

" Open, source .vimrc
nnoremap <leader>ev :tabnew $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Yank to the end of the line
nnoremap Y y$

" Copy to system clipboard
vnoremap <leader>y "+y

" Save
nnoremap <leader>s :w<cr>
nnoremap <leader>sa :wa<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>d :bd<cr>
nnoremap <leader>sq :x<cr>

" Folds
nnoremap <backspace> za
vnoremap <backspace> zf

" Tabs
nnoremap <leader>tb :tabnew<cr>
nnoremap <leader>p :tabn<cr>
nnoremap <leader>o :tabp<cr>
nnoremap <S-H> gT
nnoremap <S-L> gt

" Word spell
nnoremap <leader>tc :set spell spelllang=en_us<cr>
nnoremap <leader>tn :set nospell<cr>
nnoremap <leader>t ]s
hi clear SpellBad
hi SpellBad cterm=underline

" Moves
onoremap p i(
onoremap P a(

if has('statusline')
	" red
	hi User1 ctermbg=black ctermfg=160 guibg=black guifg=#dc322f
	" cyan
	hi User2 ctermbg=black ctermfg=37 guibg=black guifg=#2aa198
	" cyan
	hi User3 ctermbg=black ctermfg=136 guibg=black guifg=#b58900
	" base1
	hi User4 ctermbg=black ctermfg=245 guibg=black guifg=#93a1a1

	set laststatus=2
	set statusline=%3*
	set statusline+=%<%f\                     " Filename
	set statusline+=%1*
	set statusline+=%w%h%m%r                 " Options
	set statusline+=%2*
	"set statusline+=%{fugitive#statusline()} " Git
	set statusline+=%4*
	set statusline+=\ [%{&ff}/%Y]            " Filetype
	set statusline+=\ [%{getcwd()}]          " Current dir
	set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

" Load plugin config
source ~/dotfiles/vimrc.plugins.config
