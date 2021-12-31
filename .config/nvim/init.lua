local cmd = vim.cmd -- execute vim command
local fn = vim.fn -- vim function
local env = vim.env -- environment variable
local opt = vim.opt
local g = vim.g -- global variable
local o = vim.o -- global option
local wo = vim.wo -- window option

local config_home = env.XDG_CONFIG_HOME or env.HOME..'/.config'
local cache_home = env.XDG_CACHE_HOME or env.HOME..'/.cache'
local data_home = env.XDG_DATA_HOME or env.HOME..'/.local/share'

-- setup python3
if env.PYTHON3 ~= nil then
  g.python3_host_prog=env.PYTHON3
end

-- leader
g.mapleader = ' '
g.maplocalleader = ';'

-- polyglot
g.polyglot_disabled = {'bash', 'python', 'julia.plugin'}

-- View
g.vimsyn_embed='lPr'
opt.hidden = true
opt.termguicolors = true
opt.number = true
opt.ruler=true
opt.showmatch=true
opt.matchtime=1
opt.list=true
opt.listchars='tab:»-,trail:~,extends:»,precedes:«,nbsp:%'

opt.display='lastline'
opt.laststatus=2
opt.showcmd=false
opt.title=true
opt.cursorline=true
opt.visualbell=true

-- Edit
opt.clipboard='unnamedplus'
if fn.has('persistent_undo')==1 then
  opt.undofile=true
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
opt.smarttab=true
opt.expandtab=true
opt.autoindent=true
opt.smartindent=true
opt.smarttab=true
opt.tabstop=2
opt.shiftwidth=2
opt.softtabstop=2

-- Cursor
opt.scrolljump=1
opt.scrolloff=3
opt.whichwrap='b,s,h,l,<,>,[,]'
opt.virtualedit='onemore'

-- Mouse
opt.mouse='a'
opt.mousefocus=false

-- netrw
vim.g.netrw_liststyle=1
vim.g.netrw_banner=0
vim.g.netrw_sizestyle="H"
vim.g.netrw_timefmt="%Y/%m/%d(%a) %H:%M:%S"
vim.g.netrw_special_syntax=true

-- packer
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

local f=io.open(install_path, 'r')
if f==nil then
  os.execute('git clone https://github.com/wbthomason/packer.nvim '..install_path)
  require'plugins'
  cmd('PackerSync')
else
  io.close(f)
  cmd[[autocmd BufWritePost plugins.lua PackerCompile]]
  require'plugins'
end

-- colorscheme
local colorscheme = 'OceanicNext'
cmd(string.format([[
try
  colorscheme %s
catch /E185/
  echo 'colorscheme "%s" is not found'
  colorscheme darkblue
endtry
]], colorscheme, colorscheme))

-- load config files
vim.cmd[[runtime! init/*.lua]]

-- for p in io.popen('ls '..config_home..'/nvim/lua/init |grep -E "[0-9]+-.*"|xargs basename -s .lua'):lines() do
--   require('init.'..p)
-- end
