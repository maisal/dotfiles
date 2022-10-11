local haslspconfig, lspconfig = pcall(require, 'lspconfig')
local function hi(...)
  vim.api.nvim_set_hl(0, ...)
end

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local map = vim.keymap.set
if haslspconfig then
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  local on_attach = function(client, bufnr)
    require('lsp_signature').on_attach()

    -- Mappings.
    local opts = { buffer = true, silent = true }
    map('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    map('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    map('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    map('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    map('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    map('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    map('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    map('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    map('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    -- map('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    map('n', '<space>F', '<cmd>lua vim.lsp.buf.format({async=true})<CR>', opts)
    map('n', '<space>f', '<cmd>lua vim.lsp.buf.range_format()<CR>', opts)

    -- Set autocommands conditional on server_capabilities
    if client.server_capabilities.document_highlight then
      hi('LspReferenceRead', { reverse = true, bold = true })
      hi('LspReferenceText', { reverse = true, bold = true })
      hi('LspReferenceWrite', { reverse = true, bold = true })
      -- augroup('lsp_document_highlight', {})
      -- autocmd('CursorHold', { buffer = 0, callback = vim.lsp.buf.document_highlight })
      -- autocmd('CursorMoved', { buffer = 0, callback = vim.lsp.buf.clear_references })
    end
  end

  -- Use a loop to conveniently both setup defined servers
  -- and map buffer local keybindings when the language server attaches
  -- local servers = {
  --   'awk_ls',
  --   'rust_analyzer',
  --   'tsserver',
  --   'vimls',
  --   'intelephense',
  --   'pylsp',
  --   'bashls',
  --   'julials',
  --   'clangd',
  --   'texlab',
  --   'html',
  --   'jsonls',
  --   'cssls',
  --   'vimls',
  --   'taplo',
  --   'sqls',
  --   'yamlls',
  -- }
  -- for _, lsp in ipairs(servers) do
  require('mason-lspconfig').setup_handlers {
    function(lsp)
      if lsp == 'sumneko_lua' then
        local runtime_path = vim.split(package.path, ';')
        table.insert(runtime_path, 'lua/?.lua')
        table.insert(runtime_path, 'lua/?/init.lua')
        lspconfig[lsp].setup({
          on_attach = on_attach,
          capabilities = capabilities,
          settings = {
            Lua = {
              runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = runtime_path,
              },
              diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
              },
              workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file('', true),
              },
              -- Do not send telemetry data containing a randomized but unique identifier
              telemetry = {
                enable = false,
              },
            },
          },
        })
      else
        lspconfig[lsp].setup({
          on_attach = on_attach,
        })
      end
    end,
  }
  -- end

end -- if haslspconfig
