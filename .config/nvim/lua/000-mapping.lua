local nvim_set_keymap = vim.api.nvim_set_keymap

-- save/quit
nvim_set_keymap('n', 'q:', ':q', {noremap=true})
nvim_set_keymap('n', '<Leader>w', ':w<CR>', {noremap=true,silent=true})
nvim_set_keymap('n', '<Leader>W', ':w!<CR>', {noremap=true,silent=true})
nvim_set_keymap('n', '<Leader>q', ':q<CR>', {noremap=true,silent=true})
nvim_set_keymap('n', '<Leader>Q', ':q!<CR>', {noremap=true,silent=true})

-- copy
nvim_set_keymap('n', 'Y', 'y$', {noremap=true})

-- cursor
nvim_set_keymap('i', '<C-a>', '<ESC>0i', {noremap=true})
nvim_set_keymap('i', '<C-e>', '<ESC>A', {noremap=true})

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
nvim_set_keymap('v', '<C-a>', '0', {noremap=true,silent=true})
nvim_set_keymap('v', '<C-e>', '$', {noremap=true,silent=true})

-- window
nvim_set_keymap('n', '<C-w>-', ':split<CR>', {noremap=true,silent=true})
nvim_set_keymap('n', '<C-w>\\', ':vsplit<CR>', {noremap=true,silent=true})

-- search, replace
nvim_set_keymap('n', '/', '/\\v', {noremap=true})
nvim_set_keymap('n', '<Leader><Leader>', ':nohlsearch<CR>', {noremap=true,silent=true})

-- move
  -- page
  nvim_set_keymap('n', '<C-n>', '<C-e>', {noremap=true,silent=true})
  nvim_set_keymap('n', '<C-p>', '<C-y>', {noremap=true,silent=true})
  nvim_set_keymap('v', '<C-n>', '<C-e>', {noremap=true,silent=true})
  nvim_set_keymap('v', '<C-p>', '<C-y>', {noremap=true,silent=true})

  -- buffer
  nvim_set_keymap('n', '<C-j>', ':bnext<CR>', {noremap=true,silent=true})
  nvim_set_keymap('n', '<C-k>', ':bprev<CR>', {noremap=true,silent=true})

  -- tab
  nvim_set_keymap('n', '<Leader>t', 'gt', {noremap=true,silent=true})
  nvim_set_keymap('n', '<Leader>T', 'gT', {noremap=true,silent=true})

-- others
  -- select all
  nvim_set_keymap('n', '<Leader>a', 'ggVG', {noremap=true,silent=true})

  -- increment decrement
  nvim_set_keymap('n', '+', '<C-a>', {noremap=true,silent=true})
  nvim_set_keymap('n', '-', '<C-x>', {noremap=true,silent=true})

  -- reload init.vim
  nvim_set_keymap('n', '<Leader>V', ':source $MYVIMRC<CR>', {noremap=true})

