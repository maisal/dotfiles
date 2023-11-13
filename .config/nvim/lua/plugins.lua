return {
  { 'vim-denops/denops.vim', lazy = false },
  { 'nvim-lua/plenary.nvim', lazy = false },
  -- completion
  {
    'hrsh7th/nvim-cmp',
    lazy = true,
    event = { 'InsertEnter', 'CmdLineEnter' },
    dependencies = {
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-cmdline' },
      -- { 'dmitmel/cmp-cmdline-history' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'L3MON4D3/LuaSnip' },
    },
    config = function()
      require('config.nvim-cmp')
    end,
  },
  {
    'matsui54/denops-popup-preview.vim',
    dependencies = {
      { 'vim-denops/denops.vim' },
      { 'ray-x/lsp_signature.nvim' },
    },
    config = function()
      vim.fn['popup_preview#enable']()
    end,
  },
  -- colorscheme
  {
    'norcalli/nvim-colorizer.lua',
    lazy = true,
    event = 'BufEnter',
    config = function()
      require('colorizer').setup()
    end,
  },
  { 'mhartington/oceanic-next' },
  { 'wbthomason/vim-nazgul',   lazy = true },
  { 'tomasr/molokai',          lazy = true },
  { 'rafcamlet/nvim-luapad',   lazy = true, cmd = { 'Lua', 'Luapad', 'LuaRun' } },
  {
    'junegunn/vim-easy-align',
    lazy = true,
    keys = {
      { "ga", "<Plug>(EasyAlign)", mode = { 'x', 'n' } },
    },
    -- init = function()
    --   vim.keymap.set({ 'x', 'n' }, 'ga', '<Plug>(EasyAlign)', { silent = true })
    -- end,
  },
  -- syntax
  { 'vim-scripts/dbext.vim', lazy = true, ft = 'sql' },
  { 'tpope/vim-dadbod',      lazy = true, ft = 'sql' },
  { 'peterhoeg/vim-qml',     lazy = true, ft = 'qml' },
  { 'ron-rs/ron.vim',        lazy = true, ft = 'ron' },
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = true,
    event = 'BufEnter',
    build = ':TSUpdate',
    config = function()
      require('config.treesitter')
    end,
  },
  { 't-b/igor-pro-vim',      lazy = true, ft = 'igorpro' },
  { 'mityu/vim-applescript', lazy = true, ft = 'applescript' },
  { 'vmchale/ion-vim',       lazy = true, ft = 'ion' },
  -- use {'sheerun/vim-polyglot'}
  -- use {'JuliaEditorSupport/julia-vim', lazy=true, ft='julia'}
  {
    'lervag/vimtex',
    lazy = true,
    ft = 'tex',
    init = function()
      require('setup.vimtex')
    end,
    config = function()
      require('config.vimtex')
    end,
  },
  { 'ap/vim-css-color', lazy = true, ft = { 'css', 'html', 'sass', 'scss', 'stylus', 'vim' } },
  {
    'heavenshell/vim-pydocstring',
    lazy = true,
    build = 'make install',
    ft = 'python',
    config = function()
      vim.g.pydocstring_formatter = 'numpy'
    end,
  },
  { 'voldikss/vim-mma', lazy = true, ft = { 'm', 'wls' } },
  { 'hjson/vim-hjson',  lazy = true, ft = 'hjson' },
  -- use({
  --   'ckipp01/stylua-nvim',
  --   lazy = true,
  --   ft = 'lua',
  --   config = function()
  --     vim.keymap.set('n', '<Space>F', function()
  --       require('stylua-nvim').format_file()
  --     end, { buffer = true })
  --   end,
  -- })
  -- lsp
  -- use {'nvim-lua/completion-nvim', lazy=true, event='VimEnter',
  --       config=function() require('config.completion-nvim') end
  --     }
  {
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    -- {
    --   'j-hui/fidget.nvim',
    --   version = "legacy",
    --   config = function()
    --     require('fidget').setup()
    --   end,
    -- },
    { 'hrsh7th/cmp-nvim-lsp' },
    {
      'neovim/nvim-lspconfig',
      config = function()
        require('mason').setup({})
        require('mason-lspconfig').setup({})
        require('config.lspconfig')
      end,
    },
  },
  {
    'nanotee/sqls.nvim',
    lazy = true,
    ft = 'sql',
    config = function()
      require('config.sqls')
    end,
  },
  { 'simrat39/rust-tools.nvim', lazy = true, ft = 'rust' },
  {
    'simrat39/symbols-outline.nvim',
    config = function()
      require('config.symbols-outline')
    end,
  },
  -- search
  {
    {
      'petertriho/nvim-scrollbar',
      config = function()
        require('scrollbar').setup()
      end,
    },
    {
      'kevinhwang91/nvim-hlslens',
      lazy = true,
      keys = {
        { 'n',  [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]] },
        { 'N',  [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]] },
        { '*',  [[*<Cmd>lua require('hlslens').start()<CR>]] },
        { '#',  [[#<Cmd>lua require('hlslens').start()<CR>]] },
        { 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]] },
        { 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]] },
      },
      config = function()
        require('scrollbar.handlers.search').setup()
      end,
    },
  },
  -- fuzzy finder
  {
    {
      'nvim-telescope/telescope.nvim',
      lazy = true,
      cmd = 'Telescope',
      dependencies = {
        { 'tami5/sqlite.lua' },
        { 'nvim-telescope/telescope-frecency.nvim' },
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      },
      keys = {
        { '<C-b>', '<Cmd>Telescope buffers<CR>' }
      },
      config = function()
        require('telescope').load_extension('frecency')
        require('telescope').load_extension('fzf')
        require('telescope').load_extension('notify')
        require('telescope').setup({
          extensions = {
            fzf = {
              fuzzy = true,
              override_generic_sorter = true,
              override_file_sorter = true,
              case_mode = 'smart_case',
            },
          },
        })
      end,
    },
  },
  -- file explorer
  -- status line
  {
    { 'kyazdani42/nvim-web-devicons' },
    {
      'feline-nvim/feline.nvim',
      config = function()
        require('config.feline')
      end,
    },
  },
  -- edit
  -- use { 'tpope/vim-surround', lazy = true, event = 'VimEnter' }
  {
    'machakann/vim-sandwich',
    lazy = true,
    keys = 's',
    config = function()
      vim.keymap.set({ 'n', 'v' }, 's', '<Nop>')
    end,
  },
  { 'tpope/vim-repeat',         lazy = true },
  {
    'numToStr/Comment.nvim',
    lazy = true,
    event = 'VimEnter',
    keys = {
      { "<C-;>", "<Plug>(comment_toggle_linewise_current)" },
      { "<C-;>", "<Plug>(comment_toggle_linewise_visual)", mode = "v" },
    },
    opts = {
      mappings = {
        basic = false,
        extra = false
      }
    },
  },
  { 'dhruvasagar/vim-table-mode', lazy = true, ft = 'rst' },
  -- git
  {
    'lewis6991/gitsigns.nvim',
    lazy = true,
    event = 'BufEnter',
    config = function()
      require('gitsigns').setup()
      vim.api.nvim_set_hl(0, 'GitSignsAdd', { fg = '#99c794', bg = nil })
      vim.api.nvim_set_hl(0, 'GitSignsChange', { fg = '#6699cc', bg = nil })
      vim.api.nvim_set_hl(0, 'GitSignsDelete', { fg = '#ec5f67', bg = nil })
    end,
  },
  -- fold
  {
    'tmhedberg/SimpylFold',
    lazy = true,
    ft = { 'python' },
    config = function()
      vim.g.table_mode_corner_corner = '+'
      vim.g.table_mode_header_fillchar = '='
    end,
  },
  -- notify
  {
    'rcarriga/nvim-notify',
    config = function()
      require('notify').setup({
        background_colour = '#000000',
      })
      vim.notify = require('notify')
    end,
  },
  -- memo
  {
    'glidenote/memolist.vim',
    lazy = true,
    cmd = { 'MemoNew', 'MemoList', 'MemoGrep' },
    init = function()
      require('setup.memolist')
    end,
  },
  { 'itchyny/calendar.vim',       lazy = true, cmd = { 'Calendar' } },
  {
    'mtth/scratch.vim',
    lazy = true,
    cmd = { 'Scratch' },
    config = function()
      vim.g.scratch_persistence_file = vim.env.XDG_DATA_HOME .. '/nvim/scratch'
    end,
  },
  { 'dstein64/vim-startuptime', lazy = true, cmd = { 'StartupTime' } },
}
