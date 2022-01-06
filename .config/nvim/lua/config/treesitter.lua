hastreesitter, configs = pcall(require, 'nvim-treesitter.configs')
if hastreesitter then
  configs.setup{
    highlight = {
      enable = true,
    },
    indent = {
      enable=true,
    }
  }
  local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
  parser_config.sqlite3 = {
    install_info = {
      url = "~/dev/tree-sitter/tree-sitter-sqlite3", -- local path or git repo
      files = {"src/parser.c"}
    },
    filetype = "sql", -- if filetype does not agrees with parser name
    -- used_by = {"bar", "baz"} -- additional filetypes that use this parser
  }
end
