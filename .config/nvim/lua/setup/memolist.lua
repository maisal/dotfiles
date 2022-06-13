vim.g.memolist_memo_suffix = 'md'
vim.g.memolist_fzf = 1
vim.g.memolist_path = os.getenv('HOME') .. '/Dropbox/memo'

local map = vim.keymap.set

map('n', '<Leader>mn', '<Cmd>MemoNew<CR>')
map('n', '<Leader>ml', '<Cmd>MemoList<CR>')
map('n', '<Leader>mg', '<Cmd>MemoGrep<CR>')
