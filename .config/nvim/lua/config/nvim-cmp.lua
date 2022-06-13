local hascmp, cmp = pcall(require, 'cmp')
if hascmp then
  cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    mapping = {
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<C-n>'] = cmp.mapping.select_next_item(),
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      -- ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      }),
      ['<Tab>'] = function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
          -- elseif luasnip.expand_or_jumpable() then
          --   luasnip.expand_or_jump()
        else
          fallback()
        end
      end,
      ['<S-Tab>'] = function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
          -- elseif luasnip.jumpable(-1) then
          --   luasnip.jump(-1)
        else
          fallback()
        end
      end,
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
      { name = 'path' },
      { name = 'omni', keyword_pattern = vim.g['vimtex#re#neocomplete'] },
    },
  })

  cmp.setup.cmdline(':', {
    mapping = {
      ['<Tab>'] = {
        c = function()
          local cmp = require('cmp')
          if cmp.visible() then
            cmp.select_next_item()
          else
            feedkeys.call(keymap.t('<C-z>'), 'n')
          end
        end,
      },
      ['<S-Tab>'] = {
        c = function()
          local cmp = require('cmp')
          if cmp.visible() then
            cmp.select_prev_item()
          else
            feedkeys.call(keymap.t('<C-z>'), 'n')
          end
        end,
      },
    },
    sources = {
      { name = 'cmdline' },
    },
  })

  cmp.setup.cmdline('/', {
    mapping = {
      ['<Tab>'] = {
        c = function()
          local cmp = require('cmp')
          if cmp.visible() then
            cmp.select_next_item()
          else
            feedkeys.call(keymap.t('<C-z>'), 'n')
          end
        end,
      },
      ['<S-Tab>'] = {
        c = function()
          local cmp = require('cmp')
          if cmp.visible() then
            cmp.select_prev_item()
          else
            feedkeys.call(keymap.t('<C-z>'), 'n')
          end
        end,
      },
    },
    sources = {
      { name = 'buffer' },
    },
  })

  -- for _, cmd_type in ipairs({ ':', '/', '?', '@' }) do
  --   cmp.setup.cmdline(cmd_type, {
  --     mapping = cmp.mapping.preset.cmdline(),
  --     sources = {
  --       { name = 'cmdline_history' },
  --     },
  --   })
  -- end
end -- if hascmp
