vim.cmd[[
augroup man
  au VimEnter * set laststatus=0
augroup END
]]
vim.api.nvim_buf_set_keymap(0,'n','q','<Cmd>q<CR>',{noremap=true})
