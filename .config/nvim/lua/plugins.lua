vim.cmd[[packadd packer.nvim]]

require('packer').startup(function()
  use {'wbthomason/packer.nvim', opt = true}
  -- colorscheme
  use {'sainnhe/sonokai'}
  use {'tomasr/molokai', opt=true}
  use {'junegunn/vim-easy-align', opt=true}
  -- syntax
  use {'nvim-treesitter/nvim-treesitter', run=':TSUpdate',
        config=function() require('plugins.treesitter_config') end,
      }
  use {'sheerun/vim-polyglot'}
  use {'JuliaEditorSupport/julia-vim'}
  -- lsp
  use {'nvim-lua/completion-nvim', opt=false,
        config=function()
          vim.o.completeopt='menuone,noinsert,noselect'
          vim.o.shortmess=vim.o.shortmess..'c'
        end
      }
  use {'neovim/nvim-lspconfig', opt=false, after='completion-nvim',
        config=function() require('plugins.lspconfig_config') end,
      }
  -- fuzzy finder
  use {'nvim-telescope/telescope.nvim', opt=false,
        requires = {
          {'nvim-lua/popup.nvim'},
          {'nvim-lua/plenary.nvim'}
        }
      }
  -- status line
  use {'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true},
        config = function() require('plugins.lualine_config') end,
      }
  -- edit
  use {'tpope/vim-surround'}
  use {'tpope/vim-repeat', opt=true}
  use {'tpope/vim-commentary', opt=false,
    config = function()
		  vim.api.nvim_set_keymap('n', '<C-_>', 'gcc', {silent=true})
		  vim.api.nvim_set_keymap('v', '<C-_>', 'gc', {silent=true})
  	end
  }
  -- git
  use {'tpope/vim-fugitive'}
  use {'airblade/vim-gitgutter'}
  -- fold
  use {'tmhedberg/SimpylFold', opt=true, ft={'python'}}
  -- memo
  use {'glidenote/memolist.vim',
        setup=function() require('plugins.memolist_setup') end,
      }
end)
