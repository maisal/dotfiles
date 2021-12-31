vim.cmd[[packadd packer.nvim]]

require('packer').startup({function()
  use {'wbthomason/packer.nvim', opt=true}
  use {'vim-denops/denops.vim'}
  -- completion
  use {'Shougo/ddc.vim', tag='v1.0.0',
        requires={
          {'Shougo/ddc-around'},
          {'Shougo/ddc-matcher_head'},
          {'Shougo/ddc-sorter_rank'},
          {'Shougo/ddc-converter_remove_overlap'},
          {'Shougo/ddc-nvim-lsp'},
          {'Shougo/ddc-omni'},
          {'Shougo/pum.vim'},
          {'tani/ddc-fuzzy'},
        },
        config=[[require('config.ddc')]]
      }
  use {'matsui54/denops-popup-preview.vim',
        requires={
          {'ray-x/lsp_signature.nvim',
            config=[[require'lsp_signature'.setup()]]
          },
        },
        config=[[vim.fn['popup_preview#enable']()]],
      }
  -- snip
  use {'hrsh7th/vim-vsnip',
        requires={'hrsh7th/vim-vsnip-integ'},
      }
  -- input method
  use {'vim-skk/skkeleton', opt=true, event='VimEnter',
        requires={
          -- {'vim-denops/denops.vim'},
        },
        config=function()
          vim.fn['skkeleton#config']({
            globalJisyo=vim.env.XDG_DATA_HOME..'/skk/SKK-JISYO.L',
            userJisyo=vim.env.XDG_DATA_HOME..'/skk/skkeleton',
          })
          vim.api.nvim_set_keymap('i', '<C-j>', '<Plug>(skkeleton-enable)', {silent=true})
        end
      }
  -- colorscheme
  use {'mhartington/oceanic-next', opt=true}
  use {'wbthomason/vim-nazgul', opt=true}
  use {'tomasr/molokai', opt=true}
  use {'rafcamlet/nvim-luapad', opt=true, cmd={'Lua','Luapad','LuaRun'}}
  use {'junegunn/vim-easy-align', opt=true, event='VimEnter',
        setup=function()
          vim.api.nvim_set_keymap('x', 'ga', '<Plug>(EasyAlign)', {silent=true})
          vim.api.nvim_set_keymap('n', 'ga', '<Plug>(EasyAlign)', {silent=true})
        end,
  }
  -- syntax
  use {'vim-scripts/dbext.vim', opt=true, ft='sql'}
  use {'tpope/vim-dadbod', opt=true, ft='sql'}
  use {'peterhoeg/vim-qml', opt=true, ft='qml'}
  use {'nvim-treesitter/nvim-treesitter', run=':TSUpdate', opt=true, event='VimEnter',
        config=[[require('config.treesitter')]],
      }
  use {'t-b/igor-pro-vim', opt=true, ft='igorpro'}
  use {'mityu/vim-applescript', opt=true, ft='applescript'}
  -- use {'sheerun/vim-polyglot'}
  -- use {'JuliaEditorSupport/julia-vim', opt=true, ft='julia'}
  use {'lervag/vimtex', opt=true, ft='tex',
        setup=[[require('setup.vimtex')]],
        config=[[require('config.vimtex')]],
      }
  use {'ap/vim-css-color', opt=true, ft={'css','html','sass','scss','stylus','vim'}}
  use {'heavenshell/vim-pydocstring', opt=true, run='make install', ft='python',config=[[vim.g.pydocstring_formatter='numpy']]}
  use {'voldikss/vim-mma', opt=true, ft={'m','wls'}}
  use {'hjson/vim-hjson', opt=true, ft='hjson'}
  -- lsp
  -- use {'nvim-lua/completion-nvim', opt=true, event='VimEnter',
  --       config=[[require('config.completion-nvim')]]
  --     }
  use {'neovim/nvim-lspconfig',-- opt=true, event='VimEnter',
        config=[[require('config.lspconfig')]],
      }

  -- use {'Shougo/deoplete.nvim', run=':UpdateRemotePlugins', --opt=true, event='VimEnter',
  --       setup=function()
  --         vim.g['deoplete#enable_at_startup']=true
  --         vim.g['deoplete#enable_ignore_case']=true
  --         vim.g['deoplete#lsp#use_icons_for_candidates']=true
  --       end,
  --       config=function()
  --         vim.fn['deoplete#custom#option']('smart_case', true)
  --       end,
  --       requires = {
  --         {'deoplete-plugins/deoplete-lsp'}
  --       },
  --     }
  -- use {'hrsh7th/nvim-cmp',-- opt=true, event='VimEnter',
  --       config=[[require('setup.nvim-cmp')]],
  --       requires = {
  --         {'L3MON4D3/LuaSnip'},
  --         {'saadparwaiz1/cmp_luasnip'},
  --         {'hrsh7th/cmp-nvim-lsp'},
  --         {'hrsh7th/cmp-path'},
  --         {'hrsh7th/cmp-omni'}
  --       },
  --     }
  use {'nanotee/sqls.nvim', opt=true, ft='sql',
        config=[[require('config.sqls')]],
      }
  use {'simrat39/rust-tools.nvim', opt=true, ft='rust'}
  use {'simrat39/symbols-outline.nvim',
        config=[[require('config.symbols-outline')]]
      }
  -- fuzzy finder
  use {'nvim-telescope/telescope.nvim', opt=true, cmd={'Telescope'},
        requires = {
          {'nvim-lua/popup.nvim'},
          {'nvim-lua/plenary.nvim'}
        },
        setup=function()
          vim.api.nvim_set_keymap('n','<C-b>','<Cmd>Telescope buffers<CR>', {noremap=true,silent=true})
        end,
      }
  -- file explorer
  use {'Shougo/defx.nvim', opt=true, cmd={'Defx'},
        run=':UpdateRemotePlugins',
        setup=[[vim.api.nvim_set_keymap('n', '<Leader>l', '<Cmd>Defx<CR>',{noremap=true})]],
        config=[[require('config.defx')]],
        requires = {
          {'ryanoasis/vim-devicons'},
          {'kristijanhusak/defx-icons'},
          {'kristijanhusak/defx-git'},
        },
      }
  -- status line
  use {'hoob3rt/lualine.nvim', opt=true, event='VimEnter',
        requires = {
          {'nvim-lua/lsp-status.nvim', opt=true, module='lualine'},
          {'kyazdani42/nvim-web-devicons', opt=true},
        },
        config=[[require('config.lualine')]],
      }
  -- edit
  use {'tpope/vim-surround', opt=true, event='VimEnter'}
  use {'tpope/vim-repeat', opt=true, event='VimEnter'}
  use {'tpope/vim-commentary', opt=true, event='VimEnter',
    setup = function()
      vim.api.nvim_set_keymap('n', '<C-_>', 'gcc', {silent=true})
      vim.api.nvim_set_keymap('v', '<C-_>', 'gc', {silent=true})
    end
  }
  use {'dhruvasagar/vim-table-mode', opt=true, ft='rst'}
  -- git
  use {'tpope/vim-fugitive', opt=true, event='VimEnter',}
  use {'airblade/vim-gitgutter', opt=true, event='VimEnter',}
  -- fold
  use {'tmhedberg/SimpylFold', opt=true, ft={'python'},
        config = function()
          vim.g.table_mode_corner_corner='+'
          vim.g.table_mode_header_fillchar='='
        end
       }
  -- memo
  use {'glidenote/memolist.vim', opt=true, cmd={'MemoNew','MemoList','MemoGrep'},
        setup=[[require('setup.memolist')]],
      }
  use {'itchyny/calendar.vim', opt=true, cmd={'Calendar'}}
  use {'mtth/scratch.vim', opt=true, cmd={'Scratch'},
        config=[[vim.g.scratch_persistence_file=vim.env.XDG_DATA_HOME..'/nvim/scratch']],
      }
  use {'dstein64/vim-startuptime', opt=true, cmd={'StartupTime'}}
end,
config = {
  display = {
    open_fn = require('packer.util').float,
  }
}})
