local cmd = vim.cmd -- execute vim command
local fn = vim.fn -- vim function
local env = vim.env -- environment variable
local g = vim.g -- global variable
local o = vim.o -- global option
local wo = vim.wo -- window option

config_home = env.XDG_CONFIG_HOME or env.HOME..'/.config'
cache_home = env.XDG_CACHE_HOME or env.HOME..'/.cache'
data_home = env.XDG_DATA_HOME or env.HOME..'/.local/share'

-- setup python3
if env.PYTHON3 ~= nil then
  g.python3_host_prog=env.PYTHON3
end

-- leader
g.mapleader = ' '

-- polyglot
g.polyglot_disabled = {'bash', 'python', 'julia'}

-- View
g.vimsyn_embed='lPr'
o.hidden = true
o.termguicolors = true
wo.number = true
o.ruler=true
o.showmatch=true
o.matchtime=1
o.list=true
o.listchars='tab:»-,trail:~,extends:»,precedes:«,nbsp:%'

o.display='lastline'
o.laststatus=2
o.showcmd=false
o.title=true
o.cursorline=true
o.visualbell=true

-- Edit
o.clipboard='unnamed'
cmd[[
if has('persistent_undo')
  set undofile
endif
]]

-- Search
o.incsearch = true
o.ignorecase = true
o.smartcase = true
o.hlsearch = true
o.wildmenu = true
o.wrapscan = true
o.inccommand = 'split'

-- Indent
o.smarttab=true
cmd[[set autoindent]]
cmd[[set smartindent]]
cmd[[set smarttab]]
cmd[[set tabstop=2]]
cmd[[set shiftwidth=2]]
cmd[[set softtabstop=2]]

-- Cursor
o.scrolljump=1
o.scrolloff=3
o.whichwrap='b,s,h,l,<,>,[,]'
o.virtualedit='onemore'

-- Mouse
o.mouse='a'
o.mousefocus=false

-- packer
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  cmd('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  require'plugins'
  cmd'PackerInstall'
  cmd'PackerCompile'
else
  cmd[[autocmd BufWritePost plugins.lua PackerCompile]]
  require'plugins'
end

-- load config files
for p in io.popen('ls '..config_home..'/nvim/lua |grep -E "\\d+-.*"|xargs basename -s .lua'):lines() do
  require(p)
end

-- colorscheme
cmd[[colorscheme sonokai]]
