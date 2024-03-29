local haslualine, lualine = pcall(require, 'lualine')

local theme='OceanicNext'

if haslualine then

  lualine.setup{
    options={
      theme = theme,
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch'},
      lualine_c = {'filename'},
      lualine_x = {'encoding', 'fileformat', 'filetype'},
      lualine_y = {'progress'},
      lualine_z = {'location'}
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {'filename'},
      lualine_x = {'encoding', 'fileformat', 'filetype'},
      lualine_y = {},
      lualine_z = {}
    },
    extensions = {'fzf'}
  }
end
