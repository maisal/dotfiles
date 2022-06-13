local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local map = vim.keymap.set

augroup('terminal', {})
autocmd('TermOpen', {
  pattern = '*',
  callback = function()
    vim.api.nvim_create_user_command('Run', _G.run, { nargs = '*' })
  end,
  group = 'terminal',
})
autocmd('TermOpen', {
  pattern = '*',
  callback = function()
    map('n', 'q', [[<Cmd>bd!<CR>]], { buffer = true })
  end,
  group = 'terminal',
})
autocmd('TermOpen', {
  pattern = '*',
  callback = function()
    map('t', '<Esc>', [[<C-\><C-n>]], { buffer = true })
  end,
  group = 'terminal',
})
autocmd('TermOpen', {
  pattern = '*',
  callback = function()
    map('t', '<A-h>', [[<C-\><C-n><C-w>h]], { buffer = true })
  end,
  group = 'terminal',
})
autocmd('TermOpen', { pattern = '*', command = 'setlocal nonumber', group = 'terminal' })
autocmd(
  { 'TermOpen', 'BufWinEnter', 'WinEnter' },
  { pattern = 'term://*', command = 'startinsert', group = 'terminal' }
)
autocmd({ 'TermOpen', 'BufWinEnter', 'WinEnter' }, {
  pattern = '*',
  callback = function()
    vim.g.current_terminal_job_id = vim.b.terminal_job_id
  end,
  group = 'terminal',
})
autocmd({ 'TermClose', 'BufWinLeave' }, {
  pattern = 'term://*',
  callback = function()
    if vim.g.current_terminal_job_id == vim.b.terminal_job_id then
      vim.g.current_terminal_job_id = nil
    end
  end,
  group = 'terminal',
})

function _G.run(...)
  local arg = ({ ... })[1].fargs
  if #arg > 1 then
    local cmd = table.concat(arg, ' ') .. '\n'
    vim.api.nvim_chan_send(vim.g.current_terminal_job_id, cmd)
  else
    vim.api.nvim_chan_send(vim.g.current_terminal_job_id, arg[1] .. '\n')
  end
end
