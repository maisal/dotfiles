  " save, quit{{{
  nnoremap <silent> <Leader>w :w<CR>
  nnoremap <silent> <Leader>W :wq<CR>
  nnoremap <silent> <Leader>q :q<CR>
  nnoremap <silent> <Leader>Q :q!<CR>
  imap <silent> <C-@> <ESC>
  inoremap <C-x>s <ESC>:w<CR>i
  inoremap <C-x>c <ESC>:q<CR>
  "}}}

  " copy{{{
  nnoremap Y y$
  "}}}

  " cursor move{{{
  " inoremap <C-j> <Down>
  " inoremap <C-k> <Up>
  " inoremap <C-h> <Left>
  " inoremap <C-l> <Right>
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
  "}}}

  " window{{{
  nnoremap <C-w>- :split<CR>
  nnoremap <C-w>\ :vsplit<CR>
  "}}}

  " search, replace{{{
  nnoremap / /\v
  nnoremap <Leader>r :%s/
  nnoremap <Leader><C-r> :s/
  nnoremap <silent><Leader><Leader> :nohlsearch<CR>
  "}}}

  " page, buffer, tab move{{{
    " page
    nnoremap <silent> <C-n> <C-e>
    nnoremap <silent> <C-p> <C-y>
    vnoremap <silent> <C-n> <C-e>
    vnoremap <silent> <C-p> <C-y>

    " buffer
    nnoremap <silent> <C-j> :bprev<CR>
    nnoremap <silent> <C-k> :bnext<CR>
    " nnoremap <Leader>l :ls<CR>

    " tab
    nnoremap <Leader>t gt
    nnoremap <Leader>T gT
  "}}}

  " others{{{
    " increment, decrement
    nnoremap + <C-a>
    nnoremap - <C-x>

    " return and paste
    inoremap <silent> <C-o> <ESC>o
    nnoremap <Leader>p o<ESC>p

    " reload init.vim
    nnoremap <Leader>V :source $MYVIMRC<CR>
  "}}}
