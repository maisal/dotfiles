vim.g.memolist_memo_suffix = 'md'
vim.g.memolist_path=os.getenv('HOME')..'/Dropbox/memo'

set_keymap = vim.api.nvim_set_keymap

set_keymap('n', '[MemoList]', '<Nop>', {noremap=true})
set_keymap('n', '<Leader>m', '[MemoList]', {noremap=false})
set_keymap('n', '[MemoList]n', '<Cmd>MemoNew<CR>', {noremap=true})
set_keymap('n', '[MemoList]l', '<Cmd>MemoList<CR>', {noremap=true})
set_keymap('n', '[MemoList]g', '<Cmd>MemoGrep<CR>', {noremap=true})
