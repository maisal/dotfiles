UsePlugin 'memolist.vim'

let g:memoliset_memo_suffix = 'md'
let g:memolist_path = "$HOME/Dropbox/memo"
let g:memolist_fzf = 1

nnoremap <Leader>mn  :MemoNew<CR>
nnoremap <Leader>ml  :MemoList<CR>
nnoremap <Leader>mg  :MemoGrep<CR>
