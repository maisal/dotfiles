set encoding=utf-8
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

" finish if vim has no eval feature
if !1 | finish | endif

if getenv("XDG_DATA_HOME") != ""
  let s:VIM_DATA_HOME=expand("$XDG_DATA_HOME/vim")
else
  let s:VIM_DATA_HOME=expand("$HOME/.local/share/vim")
endif
let &undodir=s:VIM_DATA_HOME."/undo"
let &directory=s:VIM_DATA_HOME."/swap"
let &backupdir=s:VIM_DATA_HOME."/backup"
let &viewdir=s:VIM_DATA_HOME."/view"

for path in [s:VIM_DATA_HOME,&undodir,&directory,&backupdir,&viewdir]
  if !isdirectory(path)
    call mkdir(path, "p")
  endif
endfor

set viminfo+='1000,n$XDG_DATA_HOME/vim/viminfo
set runtimepath=$XDG_CONFIG_HOME/vim,$VIMRUNTIME,$XDG_CONFIG_HOME/vim/after

syntax on
colorscheme darkblue
set undofile

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
  elseif m =~ 'v'
    let n=4
    let name='VISUAL'
  endif
  return '%#Mode'.n.'# '.name.' %#ColorC# %F%m%r%h%w%=%{&fileencoding} | %{&ff} | %Y %#ColorB# %P %#ColorA# %04l:%04v '
endfunction

hi StatusLine ctermfg=black
hi ColorA ctermfg=white ctermbg=darkblue
hi ColorB ctermfg=white ctermbg=darkgray
hi ColorC ctermfg=white ctermbg=black
hi Mode1  ctermfg=white ctermbg=darkgreen
hi Mode2  ctermfg=white ctermbg=darkblue
hi Mode3  ctermfg=white ctermbg=red
hi Mode4  ctermfg=white ctermbg=darkyellow
set statusline=%!GetStatusLine()
