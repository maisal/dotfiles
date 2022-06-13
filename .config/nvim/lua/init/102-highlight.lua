local function hi(...)
  vim.api.nvim_set_hl(0, ...)
end

hi('SignColumn', { bg = nil })
hi('FoldColumn', { bg = nil, bold = true })
hi('Folded', { bg = nil, fg = 'lightgreen', bold = true })
hi('LineNr', { bg = nil })
hi('Normal', { bg = nil })
hi('EndOfBuffer', { bg = nil })
