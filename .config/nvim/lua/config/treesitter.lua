local hastreesitter, configs = pcall(require, 'nvim-treesitter.configs')
if hastreesitter then
  configs.setup({
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
  })
end
