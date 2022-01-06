vim.api.nvim_buf_set_keymap(0, 'n', 'q', '<Cmd>bd<CR>', {noremap=true,nowait=true})
vim.api.nvim_buf_set_keymap(0, 'n', 'h', '<Plug>NetrwBrowseUpDir', {noremap=false})
vim.api.nvim_buf_set_keymap(0, 'n', 'l', '<Plug>NetrwLocalBrowseCheck', {noremap=false})
