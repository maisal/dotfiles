vim.g.memolist_memo_suffix = 'md'
vim.g.memolist_path=os.getenv('HOME')..'/Dropbox/memo'

vim.api.nvim_set_keymap('n', '<Leader>mn', ':MemoNew<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<Leader>ml', ':MemoList<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<Leader>mg', ':MemoGrep<CR>', {noremap=true})
