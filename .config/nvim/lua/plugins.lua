vim.cmd([[packadd packer.nvim]])
vim.keymap.set('n', '<Leader>p', '<Cmd>PackerSync<CR>')

require('packer').startup({
  function()
    use({ 'wbthomason/packer.nvim', opt = true })
    use({ 'vim-denops/denops.vim', opt = false })
    use({ 'nvim-lua/plenary.nvim' })
    -- completion
    use({
      'hrsh7th/nvim-cmp',
      opt = true,
      event = { 'InsertEnter', 'CmdLineEnter' },
      requires = {
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
    })
    use({
      'matsui54/denops-popup-preview.vim',
      requires = {
        { 'vim-denops/denops.vim' },
        { 'ray-x/lsp_signature.nvim' },
      },
      config = function()
        vim.fn['popup_preview#enable']()
      end,
    })
    -- colorscheme
    use({
      'norcalli/nvim-colorizer.lua',
      opt = true,
      event = 'BufEnter',
      config = function()
        require('colorizer').setup()
      end,
    })
    use({ 'mhartington/oceanic-next', opt = true })
    use({ 'wbthomason/vim-nazgul', opt = true })
    use({ 'tomasr/molokai', opt = true })
    use({ 'rafcamlet/nvim-luapad', opt = true, cmd = { 'Lua', 'Luapad', 'LuaRun' } })
    use({
      'junegunn/vim-easy-align',
      opt = true,
      keys = '<Plug>(EasyAlign)',
      setup = function()
        vim.keymap.set({ 'x', 'n' }, 'ga', '<Plug>(EasyAlign)', { silent = true })
      end,
    })
    -- syntax
    use({ 'vim-scripts/dbext.vim', opt = true, ft = 'sql' })
    use({ 'tpope/vim-dadbod', opt = true, ft = 'sql' })
    use({ 'peterhoeg/vim-qml', opt = true, ft = 'qml' })
    use({
      'nvim-treesitter/nvim-treesitter',
      opt = true,
      event = 'BufEnter',
      run = ':TSUpdate',
      config = function()
        require('config.treesitter')
      end,
    })
    use({ 't-b/igor-pro-vim', opt = true, ft = 'igorpro' })
    use({ 'mityu/vim-applescript', opt = true, ft = 'applescript' })
    use({ 'vmchale/ion-vim', opt = true, ft = 'ion' })
    -- use {'sheerun/vim-polyglot'}
    -- use {'JuliaEditorSupport/julia-vim', opt=true, ft='julia'}
    use({
      'lervag/vimtex',
      opt = true,
      ft = 'tex',
      setup = function()
        require('setup.vimtex')
      end,
      config = function()
        require('config.vimtex')
      end,
    })
    use({ 'ap/vim-css-color', opt = true, ft = { 'css', 'html', 'sass', 'scss', 'stylus', 'vim' } })
    use({
      'heavenshell/vim-pydocstring',
      opt = true,
      run = 'make install',
      ft = 'python',
      config = function()
        vim.g.pydocstring_formatter = 'numpy'
      end,
    })
    use({ 'voldikss/vim-mma', opt = true, ft = { 'm', 'wls' } })
    use({ 'hjson/vim-hjson', opt = true, ft = 'hjson' })
    -- use({
    --   'ckipp01/stylua-nvim',
    --   opt = true,
    --   ft = 'lua',
    --   config = function()
    --     vim.keymap.set('n', '<Space>F', function()
    --       require('stylua-nvim').format_file()
    --     end, { buffer = true })
    --   end,
    -- })
    -- lsp
    -- use {'nvim-lua/completion-nvim', opt=true, event='VimEnter',
    --       config=function() require('config.completion-nvim') end
    --     }
    use({
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      {
        'j-hui/fidget.nvim',
        config = function()
          require('fidget').setup()
        end,
      },
      { 'hrsh7th/cmp-nvim-lsp' },
      {
        'neovim/nvim-lspconfig',
        after = 'mason-lspconfig.nvim',
        config = function()
          require('mason').setup({})
          require('mason-lspconfig').setup({})
          require('config.lspconfig')
        end,
      },
    })
    use({
      'nanotee/sqls.nvim',
      opt = true,
      ft = 'sql',
      config = function()
        require('config.sqls')
      end,
    })
    use({ 'simrat39/rust-tools.nvim', opt = true, ft = 'rust' })
    use({
      'simrat39/symbols-outline.nvim',
      config = function()
        require('config.symbols-outline')
      end,
    })
    -- search
    use({
      {
        'petertriho/nvim-scrollbar',
        config = function()
          require('scrollbar').setup()
        end,
      },
      {
        'kevinhwang91/nvim-hlslens',
        opt = true,
        keys = '/',
        setup = function()
          local opts = { silent = true }
          vim.keymap.set(
            'n',
            'n',
            [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
            opts
          )
          vim.keymap.set(
            'n',
            'N',
            [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
            opts
          )
          vim.keymap.set('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], opts)
          vim.keymap.set('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], opts)
          vim.keymap.set('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], opts)
          vim.keymap.set('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], opts)
        end,
        config = function()
          require('scrollbar.handlers.search').setup()
        end,
      },
    })
    -- fuzzy finder
    use({
      { 'tami5/sqlite.lua' },
      { 'nvim-telescope/telescope-frecency.nvim' },
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
      {
        'nvim-telescope/telescope.nvim',
        opt = true,
        cmd = 'Telescope',
        setup = function()
          vim.keymap.set('n', '<C-b>', '<Cmd>Telescope buffers<CR>', { silent = true })
        end,
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
    })
    -- file explorer
    -- status line
    use({
      { 'kyazdani42/nvim-web-devicons' },
      {
        'feline-nvim/feline.nvim',
        config = function()
          require('config.feline')
        end,
      },
    })
    use({
      'hoob3rt/lualine.nvim',
      disable = true,
      requires = {
        { 'nvim-lua/lsp-status.nvim', opt = true, module = 'lualine' },
        { 'kyazdani42/nvim-web-devicons', opt = true },
      },
      config = function()
        require('config.lualine')
      end,
    })
    -- edit
    -- use { 'tpope/vim-surround', opt = true, event = 'VimEnter' }
    use({
      'machakann/vim-sandwich',
      opt = true,
      keys = 's',
      config = function()
        vim.keymap.set({ 'n', 'v' }, 's', '<Nop>')
      end,
    })
    use({ 'tpope/vim-repeat', opt = true, keys = '.' })
    use({
      'b3nj5m1n/kommentary',
      opt = true,
      keys = { '<Plug>kommentary_line_default', '<Plug>kommentary_visual_default' },
      setup = function()
        vim.keymap.set('n', '<C-_>', '<Plug>kommentary_line_default')
        vim.keymap.set('v', '<C-_>', '<Plug>kommentary_visual_default<C-c>')
      end,
      config = function()
        vim.g.kommentary_create_default_mappings = false
        require('kommentary.config').configure_language('default', {
          prefer_single_line_comments = true,
        })
      end,
    })
    use({ 'dhruvasagar/vim-table-mode', opt = true, ft = 'rst' })
    -- git
    use({
      'lewis6991/gitsigns.nvim',
      opt = true,
      event = 'BufEnter',
      config = function()
        require('gitsigns').setup()
      end,
    })
    -- fold
    use({
      'tmhedberg/SimpylFold',
      opt = true,
      ft = { 'python' },
      config = function()
        vim.g.table_mode_corner_corner = '+'
        vim.g.table_mode_header_fillchar = '='
      end,
    })
    -- notify
    use({
      'rcarriga/nvim-notify',
      config = function()
        require('notify').setup({
          background_colour = '#000000',
        })
        vim.notify = require('notify')
      end,
    })
    -- memo
    use({
      'glidenote/memolist.vim',
      opt = true,
      cmd = { 'MemoNew', 'MemoList', 'MemoGrep' },
      setup = function()
        require('setup.memolist')
      end,
    })
    use({ 'itchyny/calendar.vim', opt = true, cmd = { 'Calendar' } })
    use({
      'mtth/scratch.vim',
      opt = true,
      cmd = { 'Scratch' },
      config = function()
        vim.g.scratch_persistence_file = vim.env.XDG_DATA_HOME .. '/nvim/scratch'
      end,
    })
    use({ 'dstein64/vim-startuptime', opt = true, cmd = { 'StartupTime' } })
  end,
  config = {
    display = {
      open_fn = require('packer.util').float,
    },
    profile = {
      enable = true,
      threshold = 1, -- integer in milliseconds, plugins which load faster than this won't be shown in profile output
    },
  },
})
