"   | | | (_)
"   | | | |_ _ __ ___  _ __ ___
"   | | | | | '_ ` _ \| '__/ __|
"   \ \_/ / | | | | | | | | (__
"    \___/|_|_| |_| |_|_|  \___|)

" My .vimrc

" PLUGINS
source ~/dotfiles/vimrc.plugins

set relativenumber        " afficher le numero des lignes
set tabstop=4     " number of visual spaces per tab
set softtabstop=4 " number of spaces per tab
set shiftwidth=4
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

set conceallevel=0 " json quotes
" Neovim cursor
set guicursor=

" avoid highlighting last search when sourcing vimrc
let @/ = ""

" Colorscheme
set t_Co=256
"let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"set background=dark
"let g:solarized_termcolors = 256 
"colorscheme solarized
" Or if you have Neovim >= 0.1.5
set termguicolors
colorscheme OceanicNext

" disable auto comments
autocmd filetype * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" filetype-specific indentation
filetype indent on

" open file at the same line that it was closed for the last time
autocmd bufwinleave ?* mkview
autocmd bufwinenter ?* silent! loadview

" leaders
let mapleader = ' '
let maplocalleader = "'"

" exit insert mode
inoremap jk <c-o>:stopinsert<cr>

noremap j gj
noremap k gk

" last edited line
nnoremap <leader>_ '.

" remove search highlighting
nnoremap <leader>* :noh<cr>

" sudo write
nnoremap <leader>W :w !sudo tee %<cr>

" yank to the end of the line
nnoremap Y y$

" copy to system clipboard
vnoremap <leader>y "+y

" save
nnoremap <leader>w :w<cr>
nnoremap <leader>q :bd<cr>

" folds
nnoremap <backspace> za
vnoremap <backspace> zf

" tabs
nnoremap <s-h> gT
nnoremap <s-l> gt

" word spell
nnoremap <leader>tc :set spell spelllang=en_us<cr>
nnoremap <leader>tn :set nospell<cr>
nnoremap <leader>t ]s
hi clear spellbad
hi spellbad cterm=underline

if has('statusline')
	" cyan
	hi user3 ctermbg=black ctermfg=237 guibg=#343d46 guifg=#EC5f67
	" base1
	hi user4 ctermbg=black ctermfg=235 guibg=#1b2b34 guifg=#99c794

	set laststatus=2
	set statusline=%3*
	set statusline+=%<%f                     " filename
	set statusline+=%1*
	set statusline+=\ %w%h%m%r                 " options
	set statusline+=%2*
	"set statusline+=%{fugitive#statusline()} " git
	set statusline+=%4*
	set statusline+=\ (%{&ff}/%y)            " filetype
	set statusline+=\ %{getcwd()}          " current dir
	set statusline+=%=%-14.(%l,%c%v%)\ %p%%  " right aligned file nav info
endif

" load plugin config
source ~/dotfiles/vimrc.plugins.config
