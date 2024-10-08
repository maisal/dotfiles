local fn = vim.fn               -- vim function
local env = vim.env             -- environment variable
local opt = vim.opt             -- global option
local opt_local = vim.opt_local -- local option
local g = vim.g                 -- global variable
local autocmd = vim.api.nvim_create_autocmd

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
opt.fillchars = 'vert:│,foldopen:\\u25bd,foldclose:\\u25b7,eob:~'

opt.display = 'lastline'
opt.laststatus = 3
opt.cmdheight = 0
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
opt.whichwrap = 'b,s,<,>,[,]'
opt.virtualedit = 'onemore'

-- Mouse
opt.mouse = 'a'
opt.mousefocus = false

-- GUI
opt.guifont = 'JetBrainsMono Nerd Font:h13'

if g.neovide then
  g.neovide_transparency = 0.8
  g.neovide_show_border = false
  g.neovide_cursor_animation_length = 0
  g.neovide_scroll_animation_far_lines = 0
  g.neovide_scroll_animation_far_lines = 0
  g.neovide_unlink_border_highlights = true
end

-- netrw
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.netrw_liststyle = 1
g.netrw_banner = 0
g.netrw_sizestyle = 'H'
g.netrw_timefmt = '%Y/%m/%d(%a) %H:%M:%S'
g.netrw_special_syntax = true

-- lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")

-- packer
-- local install_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'
-- if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
--   os.execute('git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
--   require('plugins')
--   vim.cmd('PackerSync')
-- else
--   autocmd('BufWritePost', { pattern = 'plugins.lua', command = 'PackerCompile' })
--   require('plugins')
-- end

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
