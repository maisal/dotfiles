vim.lsp.config("*", {
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then
      return
    end

    if not vim.b[args.buf].user_lsp_signature_attached then
      require("lsp_signature").on_attach({}, args.buf)
      vim.b[args.buf].user_lsp_signature_attached = true
    end
    local opts = { buffer = args.buf, silent = true }
    vim.keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    vim.keymap.set("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
    vim.keymap.set("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
    vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    vim.keymap.set("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    vim.keymap.set("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
    vim.keymap.set("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
    vim.keymap.set("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
    vim.keymap.set("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    vim.keymap.set("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    vim.keymap.set("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    vim.keymap.set("n", "[d", function()
      vim.diagnostic.jump({ count = -1, float = true })
    end, opts)
    vim.keymap.set("n", "]d", function()
      vim.diagnostic.jump({ count = 1, float = true })
    end, opts)

    if client:supports_method("textDocument/documentHighlight", args.buf) then
      for _, name in ipairs({ "LspReferenceRead", "LspReferenceText", "LspReferenceWrite" }) do
        vim.api.nvim_set_hl(0, name, { reverse = true, bold = true })
      end
    end
  end,
})

-- Install servers with :Mason, then add their nvim-lspconfig names here.
-- Installation alone does not enable a server; restart Nvim after editing this list.
vim.lsp.enable({
  "ast_grep",
  "biome",
  "buf_ls",
  "clangd",
  "cmake",
  "cssls",
  "docker_compose_language_service",
  "dockerls",
  "eslint",
  "fortls",
  "golangci_lint_ls",
  "gopls",
  "html",
  "jsonls",
  "lemminx",
  "lua_ls",
  "marksman",
  "mesonlsp",
  "pyright",
  "ruff",
  "rust_analyzer",
  "sqlls",
  "stylua",
  "svelte",
  "tailwindcss",
  "taplo",
  "texlab",
  "tinymist",
  "tombi",
  "ts_ls",
  "vacuum",
  "yamlls",
})
