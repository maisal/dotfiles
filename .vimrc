set encoding=utf-8
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
set viminfo=
set noswapfile
set nobackup
set noundofile

nnoremap <silent> <Space>w <Cmd>w<CR>
nnoremap <silent> <Space>W <Cmd>wq<CR>
nnoremap <silent> <Space>q <Cmd>q<CR>
nnoremap <silent> <Space>Q <Cmd>q!<CR>
" for JIS Keyboard
imap <silent> <C-@> <ESC>

inoremap <C-a> <Cmd>norm 0<CR>
inoremap <C-e> <Cmd>norm $l<CR>
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
nnoremap <Space>r :%s/
nnoremap <Space><C-r> :s/
nnoremap <silent><Space><Space> :nohlsearch<CR>

nnoremap <C-w>- :split<CR>
nnoremap <C-w>\ :vsplit<CR>

tnoremap <C-w><C-[> <C-w>N

" finish if vim has no eval feature
if !1 | finish | endif

syntax on
colorscheme desert

function! GetStatusLine()
  let m=mode()
  if m =~ 'i'
    let n=1
    let name='INSERT'
  elseif m =~ 'n'
    let n=2
    let name='NORMAL'
  elseif m =~ 'R'
    let n=3
    let name='REPLACE'
  elseif m =~# "\<C-V>"
    let n=4
    let name='V-BLOCK'
  elseif m =~# 'V'
    let n=4
    let name='V-LINE'
  elseif m =~# 'v'
    let n=4
    let name='VISUAL'
  elseif m =~# "\<C-S>"
    let n=5
    let name='S-BLOCK'
  elseif m =~# 'S'
    let n=5
    let name='S-LINE'
  elseif m =~# 's'
    let n=5
    let name='SELECT'
  elseif m =~ 'c'
    let n=2
    let name='COMMAND'
  elseif m =~ 't'
    let n=6
    let name='TERMINAL'
  else
    let n=0
    let name=m
  endif
  return '%#Mode'.n.'# '.name.' %#ColorC# %F%m%r%h%w%=%{&fileencoding} | %{&ff} | %Y %#ColorB# %P %#Mode'.n.'# %04l:%04v '
endfunction

hi StatusLine ctermfg=black
hi ColorA ctermfg=white ctermbg=darkblue
hi ColorB ctermfg=white ctermbg=darkgray
hi ColorC ctermfg=white ctermbg=black
hi Mode1  ctermfg=white ctermbg=darkgreen
hi Mode2  ctermfg=white ctermbg=darkblue
hi Mode3  ctermfg=white ctermbg=red
hi Mode4  ctermfg=white ctermbg=darkmagenta
hi Mode5  ctermfg=white ctermbg=brown
hi Mode6  ctermfg=white ctermbg=gray
hi Normal ctermbg=None
set statusline=%!GetStatusLine()
