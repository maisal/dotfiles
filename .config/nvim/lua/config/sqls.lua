local hassqls, sqls = pcall(require, 'sqls')
if hassqls then
	sqls.setup{
		picker='telescope'
	}
	vim.api.nvim_buf_set_keymap(0, 'n', '<LocalLeader>sc', '<Cmd>SqlsSwitchConnection<CR>', {noremap=true})
	vim.api.nvim_buf_set_keymap(0, 'n', '<LocalLeader>e', '<Cmd>SqlsExecuteQuery<CR>', {noremap=true})
	vim.api.nvim_buf_set_keymap(0, 'v', '<LocalLeader>e', ':SqlsExecuteQuery<CR>', {noremap=true})
	vim.api.nvim_buf_set_keymap(0, 'i', '<C-s>e', '<Cmd>SqlsExecuteQuery<CR>', {noremap=true})
end
