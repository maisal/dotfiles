haslualine, lualine = pcall(require, 'lualine')
if haslualine then
	lualine.status{
		options={
			theme = 'oceanicnext',
		},
	}
end
