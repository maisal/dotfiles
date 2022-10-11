local map = vim.keymap.set

-- save/quit
map('n', '<Leader>w', '<Cmd>w<CR>')
map('n', '<Leader>W', '<Cmd>w!<CR>')
map('n', '<Leader>q', '<Cmd>q<CR>')
map('n', '<Leader>Q', '<Cmd>q!<CR>')

-- copy, delete
map('n', 'x', '"_x')
map('n', 's', '"_s')
map('n', 'Y', 'y$')

-- cursor
map('i', '<C-a>', '<Cmd>norm 0<CR>')
map('i', '<C-e>', '<Cmd>norm $l<CR>')
map('i', '<C-b>', '<Cmd>norm h<CR>')
map('i', '<C-f>', '<Cmd>norm l<CR>')
map('i', '<C-k>', '<Cmd>norm D<CR>')
map('i', '<C-y>', '<Cmd>norm p<CR>')
map('i', '<C-_>', '<Cmd>norm u<CR>')
map('i', '<C-l>', '<Cmd>norm zz<CR>')
map('i', '<down>', '<Cmd>norm gj<CR>')
map('i', '<up>', '<Cmd>norm gk<CR>')

map({ 'n', 'v' }, 'j', 'gj')
map({ 'n', 'v' }, 'k', 'gk')
map({ 'n', 'v' }, '<down>', 'gj')
map({ 'n', 'v' }, '<up>', 'gk')
map({ 'n', 'v' }, '<C-a>', '0', { silent = true })
map({ 'n', 'v' }, '<C-e>', '$', { silent = true })

-- window
map('n', '<C-w>-', '<Cmd>split<CR>')
map('n', '<C-w>\\', '<Cmd>vsplit<CR>')
map('n', '<C-q>', '<Cmd>vsplit<CR>')

-- search, replace
map('n', '/', '/\\v')
map('n', '<Leader><Leader>', '<Cmd>nohlsearch<CR>')

-- move
-- page
map({ 'n', 'v' }, '<C-n>', '<C-e>')
map({ 'n', 'v' }, '<C-p>', '<C-y>')

-- buffer
map('n', '<C-j>', '<Cmd>bnext<CR>')
map('n', '<C-k>', '<Cmd>bprev<CR>')

-- tab
map('n', '<C-l>', 'gt')
map('n', '<C-h>', 'gT')

-- window
map('n', '<A-h>', '<C-w>h')
map('n', '<A-j>', '<C-w>j')
map('n', '<A-k>', '<C-w>k')
map('n', '<A-l>', '<C-w>l')
map('t', '<A-h>', '<C-\\><C-n><C-w>h')
map('t', '<A-j>', '<C-\\><C-n><C-w>j')
map('t', '<A-k>', '<C-\\><C-n><C-w>k')
map('t', '<A-l>', '<C-\\><C-n><C-w>l')

-- others
-- digraph
map('n', [[<A-g>]], 'ga')
map('i', [[<A- >]], '<C-k>')
-- fold
map('n', '<CR>', function()
  return vim.fn.foldclosed(vim.api.nvim_win_get_cursor(0)[1]) > 0 and 'zo' or '<CR>'
end, { expr = true })

-- select all
map('n', '<Leader>a', 'ggVG')

-- increment decrement
map({ 'n', 'v' }, '+', '<C-a>')
map({ 'n', 'v' }, '-', '<C-x>')

-- reload init.lua
map('n', '<Leader>V', '<Cmd>luafile $XDG_CONFIG_HOME/nvim/init.lua<CR>')
