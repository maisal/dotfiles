local nvim_set_keymap = vim.api.nvim_set_keymap

-- save/quit
nvim_set_keymap('n', '<Leader>w', '<Cmd>w<CR>', {noremap=true})
nvim_set_keymap('n', '<Leader>W', '<Cmd>w!<CR>', {noremap=true})
nvim_set_keymap('n', '<Leader>q', '<Cmd>q<CR>', {noremap=true})
nvim_set_keymap('n', '<Leader>Q', '<Cmd>q!<CR>', {noremap=true})

-- copy, delete
nvim_set_keymap('n', 'x', '"_x', {noremap=true})
nvim_set_keymap('n', 's', '"_s', {noremap=true})
nvim_set_keymap('n', 'Y', 'y$', {noremap=true})

-- cursor
nvim_set_keymap('i', '<C-a>', '<Cmd>norm 0<CR>', {noremap=true})
nvim_set_keymap('i', '<C-e>', '<Cmd>norm $l<CR>', {noremap=true})
nvim_set_keymap('i', '<C-b>', '<Cmd>norm h<CR>', {noremap=true})
nvim_set_keymap('i', '<C-f>', '<Cmd>norm l<CR>', {noremap=true})
nvim_set_keymap('i', '<C-k>', '<Cmd>norm D<CR>', {noremap=true})
nvim_set_keymap('i', '<C-y>', '<Cmd>norm p<CR>', {noremap=true})
nvim_set_keymap('i', '<C-_>', '<Cmd>norm u<CR>', {noremap=true})
nvim_set_keymap('i', '<C-l>', '<Cmd>norm zz<CR>', {noremap=true})
nvim_set_keymap('i', '<down>', '<Cmd>norm gj<CR>', {noremap=true})
nvim_set_keymap('i', '<up>', '<Cmd>norm gk<CR>', {noremap=true})


nvim_set_keymap('n', 'j', 'gj', {noremap=true})
nvim_set_keymap('n', 'k', 'gk', {noremap=true})
nvim_set_keymap('n', '<down>', 'gj', {noremap=true})
nvim_set_keymap('n', '<up>', 'gk', {noremap=true})
nvim_set_keymap('n', '<C-a>', '0', {noremap=true,silent=true})
nvim_set_keymap('n', '<C-e>', '$', {noremap=true,silent=true})

nvim_set_keymap('v', 'j', 'gj', {noremap=true})
nvim_set_keymap('v', 'k', 'gk', {noremap=true})
nvim_set_keymap('v', '<down>', 'gj', {noremap=true})
nvim_set_keymap('v', '<up>', 'gk', {noremap=true})
nvim_set_keymap('v', '<C-a>', '^', {noremap=true})
nvim_set_keymap('v', '<C-e>', '$', {noremap=true})

-- window
nvim_set_keymap('n', '<C-w>-', '<Cmd>split<CR>', {noremap=true})
nvim_set_keymap('n', '<C-w>\\', '<Cmd>vsplit<CR>', {noremap=true})
nvim_set_keymap('n', '<C-q>', '<Cmd>vsplit<CR>', {noremap=true})

-- search, replace
nvim_set_keymap('n', '/', '/\\v', {noremap=true})
nvim_set_keymap('n', '<Leader><Leader>', '<Cmd>nohlsearch<CR>', {noremap=true})

-- move
  -- page
  nvim_set_keymap('n', '<C-n>', '<C-e>', {noremap=true})
  nvim_set_keymap('n', '<C-p>', '<C-y>', {noremap=true})
  nvim_set_keymap('v', '<C-n>', '<C-e>', {noremap=true})
  nvim_set_keymap('v', '<C-p>', '<C-y>', {noremap=true})

  -- buffer
  nvim_set_keymap('n', '<C-j>', '<Cmd>bnext<CR>', {noremap=true})
  nvim_set_keymap('n', '<C-k>', '<Cmd>bprev<CR>', {noremap=true})

  -- tab
  nvim_set_keymap('n', '<C-l>', 'gt', {noremap=true})
  nvim_set_keymap('n', '<C-h>', 'gT', {noremap=true})

  -- window
  nvim_set_keymap('n', '<A-h>', '<C-w>h', {noremap=true})
  nvim_set_keymap('n', '<A-j>', '<C-w>j', {noremap=true})
  nvim_set_keymap('n', '<A-k>', '<C-w>k', {noremap=true})
  nvim_set_keymap('n', '<A-l>', '<C-w>l', {noremap=true})
  nvim_set_keymap('t', '<A-h>', '<C-\\><C-n><C-w>h', {noremap=true})
  nvim_set_keymap('t', '<A-j>', '<C-\\><C-n><C-w>j', {noremap=true})
  nvim_set_keymap('t', '<A-k>', '<C-\\><C-n><C-w>k', {noremap=true})
  nvim_set_keymap('t', '<A-l>', '<C-\\><C-n><C-w>l', {noremap=true})

-- others
  -- select all
  nvim_set_keymap('n', '<Leader>a', 'ggVG', {noremap=true})

  -- increment decrement
  nvim_set_keymap('n', '+', '<C-a>', {noremap=true})
  nvim_set_keymap('n', '-', '<C-x>', {noremap=true})

  -- reload init.lua
  nvim_set_keymap('n', '<Leader>V', '<Cmd>luafile $XDG_CONFIG_HOME/nvim/init.lua<CR>', {noremap=true})

