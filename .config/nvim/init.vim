let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:data_home = empty($XDG_DATA_HOME) ? expand('~/.local/share') : $XDG_DATA_HOME


let s:color_scheme = "molokai"
let g:polyglot_disabled=['c/c++','c++11']

if has('nvim')
  let g:python3_host_prog = '/usr/local/bin/python3'
endif

" load fzf for fzf.vim
set rtp+=/usr/local/opt/fzf

let g:mapleader="\<Space>"

" vim-plug{{{
" Install vim-plug if not installed
let s:vimplug_path=s:data_home . '/nvim/site/autoload/plug.vim'
if empty(glob(s:vimplug_path))
  call system('curl -fLo ' . shellescape(s:vimplug_path) . ' --create-dirs' .
        \' https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" load plugins
call plug#begin(s:cache_home . '/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'liuchengxu/vista.vim'
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'tomasr/molokai'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'Shougo/context_filetype.vim'
Plug 'Yggdroot/indentLine'
Plug 't-b/igor-pro-vim', {'for': 'igorpro'}
Plug 'tmhedberg/SimpylFold', {'for': 'python'}
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'thinca/vim-quickrun'
Plug 'sheerun/vim-polyglot'
Plug 'gu-fan/riv.vim', {'for': 'rst'}
Plug 'rizzatti/dash.vim'
Plug 'antoinemadec/FixCursorHold.nvim' " for Fern
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/glyph-palette.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/fern.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'machakann/vim-highlightedyank'
Plug 'szymonmaszke/vimpyter'
Plug 'glidenote/memolist.vim'
Plug 'mbbill/undotree'
Plug 'simeji/winresizer'
Plug 'easymotion/vim-easymotion'
Plug 'MarcWeber/vim-addon-mw-utils' " for snipmate
Plug 'tomtom/tlib_vim' " for snipmate
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'

call plug#end()

" Install plugins if not installed
augroup vim-plug
  autocmd VimEnter *
    \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \|   PlugInstall --sync | q
    \| endif
augroup END
"}}}

" View setting{{{

set hidden
set termguicolors
set number
au filetype terminal setlocal nonumber
set ruler
set showmatch matchtime=1
set list
set listchars=tab:»-,trail:~,extends:»,precedes:«,nbsp:%

"長い行を省略せずに表示する
set display=lastline
set laststatus=2
set noshowcmd
set title
set cursorline
set visualbell
" 一行がmax_column文字以上のときhighlight
"let s:max_column=101
"highlight turn gui=standout cterm=standout
"call matchadd("turn", '.\%>'. s:max_column .'v')

"全角スペースをハイライト表示
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd ColorScheme       * call ZenkakuSpace()
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
  augroup END
  call ZenkakuSpace()
endif
"}}}

" Editing setting{{{
set clipboard=unnamed
"" undo
if has('persistent_undo')
  set undofile
endif
"}}}

" Search setting{{{
set incsearch
set ignorecase
set smartcase
set hlsearch
set wildmenu
set wrapscan
set inccommand=split
"}}}

" Indent setting{{{
set autoindent
set smartindent
set smarttab
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
"}}}

" Cursor setting{{{
set scrolljump=1
set scrolloff=3
set whichwrap=b,s,h,l,<,>,[,]
set virtualedit=onemore
"}}}

" Mouse setting{{{
set mouse=a
set nomousefocus
set mousehide
set guioptions+=a
"}}}

" netrw setting{{{
let g:netrw_liststyle=3
let g:netrw_banner=1
let g:netrw_sizestyle="H"
let g:netrw_timefmt="%Y/%m/%d(%a) %H:%M:%S"
let g:netrw_preview=1
let g:netw_alto=1
"}}}

" load config files
let s:plugs = get(s:, 'plugs', get(g:, 'plugs', {}))
function! FindPlugin(name) abort
  return has_key(s:plugs, a:name) ? isdirectory(s:plugs[a:name].dir) : 0
endfunction
command! -nargs=1 UsePlugin if !FindPlugin(<args>) | finish | endif

runtime! _config/*.vim

" set colorscheme
execute("colorscheme " . s:color_scheme)
