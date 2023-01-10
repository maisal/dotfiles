local api = vim.api
local augroup = api.nvim_create_augroup
local autocmd = api.nvim_create_autocmd
local function getline(lineNr)
  return vim.api.nvim_buf_get_lines(0, lineNr - 1, lineNr, false)[1]
end

vim.opt.foldmethod = 'syntax'
vim.opt.foldcolumn = '4'
function _G.NeatFoldText()
  local line = ' ' .. getline(vim.v.foldstart):gsub([[^%s*[#"]?%s*]], ''):gsub([[%s*[#"]?%s*{{{%d*%s*]], '') .. ' '
  local lines_count = vim.v.foldend - vim.v.foldstart + 1
  local lines_count_text = '| ' .. ('%10s'):format(lines_count .. ' lines') .. ' |'
  local foldchar = vim.o.fillchars:match([[fold:(.)]]) or ''
  local foldtextstart = (('+'):rep(vim.v.foldlevel) .. foldchar:rep(vim.v.foldlevel * 2) .. line):sub(
    1,
    math.floor((api.nvim_win_get_width(0) * 2) / 3) + 1
  )
  local foldtextend = lines_count_text .. foldchar:rep(8)
  local foldtextlength = (foldtextstart .. foldtextend):gsub('.', 'x'):len() + vim.wo.foldcolumn
  return foldtextstart .. foldchar:rep(api.nvim_win_get_width(0) - foldtextlength) .. foldtextend
end

vim.opt.foldtext = 'v:lua.NeatFoldText()'

augroup('filetype_fold', {})
autocmd('Filetype', {
  pattern = { 'conf', 'vim', 'fish' },
  callback = function()
    vim.opt_local.foldmethod = 'marker'
  end,
  group = 'filetype_fold',
})
