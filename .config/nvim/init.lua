local fn = vim.fn -- vim function
local env = vim.env -- environment variable
local opt = vim.opt -- global option
local opt_local = vim.opt_local -- local option
local g = vim.g -- global variable
local autocmd = vim.api.nvim_create_autocmd

local config_home = env.XDG_CONFIG_HOME or env.HOME .. '/.config'
local cache_home = env.XDG_CACHE_HOME or env.HOME .. '/.cache'
local data_home = env.XDG_DATA_HOME or env.HOME .. '/.local/share'

-- setup python3
if env.PYTHON3 ~= nil then
  g.python3_host_prog = env.PYTHON3
end

-- leader
g.mapleader = ' '
g.maplocalleader = ';'

-- View
g.vimsyn_embed = 'lPr'
opt.hidden = true
opt.termguicolors = true
opt.number = true
opt.ruler = true
opt.showmatch = true
opt.matchtime = 1
opt.list = true
opt.listchars = 'tab:»-,trail:~,extends:»,precedes:«,nbsp:◦,eol:↵'

opt.display = 'lastline'
opt.laststatus = 2
opt.showcmd = false
opt.title = true
opt.cursorline = true
opt.visualbell = true
opt.signcolumn = 'yes'

-- Edit
opt.updatetime = 100
opt.clipboard = 'unnamedplus'
if fn.has('persistent_undo') == 1 then
  opt.undofile = true
end

-- Search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.wildmenu = true
opt.wrapscan = true
opt.inccommand = 'split'

-- Indent
opt.smarttab = true
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.smarttab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2

-- Cursor
opt.scrolljump = 1
opt.scrolloff = 3
opt.whichwrap = 'b,s,h,l,<,>,[,]'
opt.virtualedit = 'onemore'

-- Mouse
opt.mouse = 'a'
opt.mousefocus = false

-- netrw
g.netrw_liststyle = 1
g.netrw_banner = 0
g.netrw_sizestyle = 'H'
g.netrw_timefmt = '%Y/%m/%d(%a) %H:%M:%S'
g.netrw_special_syntax = true

-- packer
local install_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  os.execute('git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  require('plugins')
  vim.cmd('PackerSync')
else
  autocmd('BufWritePost', { pattern = 'plugins.lua', command = 'PackerCompile' })
  require('plugins')
end

-- colorscheme
local colorscheme = 'OceanicNext'

local hascolorscheme, _ = pcall(function(c)
  vim.cmd('colorscheme ' .. c)
end, colorscheme)
if not hascolorscheme then
  print('colorscheme ' .. colorscheme .. ' is not found')
  vim.cmd([[colorscheme darkblue]])
end

-- load config files
require('init')
