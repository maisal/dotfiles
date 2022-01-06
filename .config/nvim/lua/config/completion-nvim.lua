local function t(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function _G.smart_tab()
    return vim.fn.pumvisible() == 1 and t'<C-n>' or t'<Tab>'
end

function _G.smart_s_tab()
    return vim.fn.pumvisible() == 1 and t'<C-p>' or t'<S-Tab>'
end

vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.smart_tab()', {expr = true, noremap = true})
vim.api.nvim_set_keymap('i', '<S-Tab>', 'v:lua.smart_s_tab()', {expr = true, noremap = true})

vim.o.completeopt='menuone,noinsert,noselect'
vim.o.shortmess=vim.o.shortmess..'c'
