"   | | | (_)
"   | | | |_ _ __ ___  _ __ ___
"   | | | | | '_ ` _ \| '__/ __|
"   \ \_/ / | | | | | | | | (__
"    \___/|_|_| |_| |_|_|  \___|)

" My .vimrc

" Numbering
set number
set relativenumber        " afficher le numero des lignes

set tabstop=4     " number of visual spaces per tab
set softtabstop=4 " number of spaces per tab
set shiftwidth=4
set nolist
set nospell       " disable spell checking
set noswapfile    " no swap files are created
set lazyredraw    " only redraw when needed
set autoindent    " reproduit l'indentation de la ligne précédente
set numberwidth=1 " espaces pris par les numeros de ligne
set hidden        " buffer switching without saving
set scrolljump=5  " Lines to scroll when cursor leaves screen
set scrolloff=3   " Minimum lines to keep above and below cursor
syntax enable     " coloration syntaxique
" filetype-specific indentation
filetype indent on

" Search
set hlsearch      " highlight search results
set incsearch     " cherche pendant qu'on tape
set ignorecase

set cursorline    " highlight current line

set conceallevel=0 " json quotes
" Colorscheme
colorscheme slate
set t_Co=256


" leaders
let mapleader = ' '
let maplocalleader = ","

" exit insert mode
inoremap jk <c-o>:stopinsert<cr>

noremap j gj
noremap k gk

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

" Buffers / Quickfix
nnoremap <leader>q :bd<cr>
nnoremap <leader><tab> :b#<cr>
nnoremap <silent> ]b :<C-u>bnext<CR>
nnoremap <silent> [b :<C-u>bprev<CR>
nnoremap <silent> ]q :<C-u>cnext<CR>
nnoremap <silent> [q :<C-u>cprev<CR>

" Statusline
set laststatus=2
set statusline=%f
set statusline+=%m

" PLUGINS
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'homerours/jumper.vim'

"" PAIRS
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'

"" COMMENT
Plug 'scrooloose/nerdcommenter'

call plug#end()

" FZF
nmap <C-p> :FZF<CR>
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9  }  }
