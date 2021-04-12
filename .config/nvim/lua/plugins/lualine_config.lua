haslualine, lualine = pcall(require, 'lualine')
if haslualine then
	lualine.setup{
		options={
			theme = 'oceanicnext',
		},
	}
end
