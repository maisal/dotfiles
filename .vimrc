syntax on
colorscheme darkblue
set number
set cursorline
set ruler
set showmatch matchtime=1
set list
set listchars=tab:»-,trail:~,extends:»,precedes:«,nbsp:%
set display=lastline
set laststatus=2
set noshowcmd
set title
set clipboard=unnamed
set incsearch
set ignorecase
set smartcase
set hlsearch
set wildmenu
set wrapscan
set autoindent
set smartindent
set smarttab
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set scrolljump=1
set scrolloff=3
set whichwrap=b,s,h,l,<,>,[,]
set virtualedit=onemore
set mouse=a
set nomousefocus
set mousehide
set guioptions+=a

let g:mapleader="\<Space>"

nnoremap <silent> <Leader>w :w<CR>
nnoremap <silent> <Leader>W :wq<CR>
nnoremap <silent> <Leader>q :q<CR>
nnoremap <silent> <Leader>Q :q!<CR>
imap <silent> <C-@> <ESC>

inoremap <C-a> <ESC>0i
inoremap <C-e> <ESC>A
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk
nnoremap <silent> <C-a> 0
nnoremap <silent> <C-e> $
vnoremap j gj
vnoremap k gk
vnoremap <down> gj
vnoremap <up> gk
vnoremap <silent> <C-a> 0
vnoremap <silent> <C-e> $

nnoremap Y y$

nnoremap / /\v
nnoremap <Leader>r :%s/
nnoremap <Leader><C-r> :s/
nnoremap <silent><Leader><Leader> :nohlsearch<CR>

nnoremap <C-w>- :split<CR>
nnoremap <C-w>\ :vsplit<CR>
