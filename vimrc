" My .vimrc

" Numbering
set number
set relativenumber

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
filetype indent on " filetype-specific indentation

" Search
set hlsearch      " highlight search results
set incsearch     " cherche pendant qu'on tape
set ignorecase

set cursorline    " highlight current line

" Colorscheme
colorscheme sorbet
"colorscheme habamax

" New line after comment is not commented
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

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
nnoremap ]b :<C-u>bnext<CR>
nnoremap [b :<C-u>bprev<CR>
nnoremap ]q :<C-u>cnext<CR>
nnoremap [q :<C-u>cprev<CR>

" Windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Tabs
nnoremap L :tabn<CR>
nnoremap H :tabp<CR>

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
