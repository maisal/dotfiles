local components = {
  active = {},
  inactive = {},
}
table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.active, {})

local colors = {
  base00 = '#1b2b34',
  base01 = '#343d46',
  base02 = '#4f5b66',
  base03 = '#65737e',
  base04 = '#a7adba',
  base05 = '#c0c5ce',
  base06 = '#cdd3de',
  base07 = '#d8dee9',
  red = '#ec5f67',
  orange = '#f99157',
  yellow = '#fac863',
  green = '#99c794',
  cyan = '#62b3b2',
  blue = '#6699cc',
  purple = '#c594c5',
  brown = '#ab7967',
  white = '#ffffff',
}

local vi_mode_colors = {
  NORMAL = 'blue',
  OP = 'blue',
  INSERT = 'green',
  CONFIRM = 'green',
  VISUAL = 'orange',
  LINES = 'orange',
  BLOCK = 'orange',
  REPLACE = 'red',
  ['V-REPLACE'] = 'red',
  ENTER = 'cyan',
  MORE = 'cyan',
  SELECT = 'orange',
  COMMAND = 'blue',
  SHELL = 'green',
  TERM = 'blue',
  NONE = 'NONE',
}

-- Component that shows Vi mode with highlight
local vi_mode = require('feline.providers.vi_mode')

components.active[1][1] = {
  provider = vi_mode.get_vim_mode,
  hl = function()
    return {
      name = require('feline.providers.vi_mode').get_mode_highlight_name(),
      fg = 'white',
      bg = require('feline.providers.vi_mode').get_mode_color(),
      style = 'bold',
    }
  end,
  left_sep = {
    str = ' ',
    hl = function()
      return {
        name = require('feline.providers.vi_mode').get_mode_highlight_name(),
        bg = require('feline.providers.vi_mode').get_mode_color(),
      }
    end,
  },
  right_sep = {
    str = 'slant_right_2',
    hl = function()
      return {
        fg = vi_mode.get_mode_color(),
        bg = 'base03',
      }
    end,
  },
}

-- Component that shows current git branch
components.active[1][2] = {
  provider = 'git_branch',
  hl = {
    fg = 'white',
    bg = 'base03',
    style = 'bold',
  },
  left_sep = {
    str = ' ',
    hl = {
      bg = 'base03',
    },
  },
  right_sep = {
    str = 'slant_right_2_thin',
    hl = {
      fg = 'NONE',
      bg = 'base03',
      style = 'bold',
    },
  },
}
-- Component that shows file info
components.active[1][3] = {
  provider = 'file_info',
  hl = {
    fg = 'white',
    bg = 'base03',
    style = 'bold',
  },
  left_sep = {
    str = ' ',
    hl = {
      bg = 'base03',
    },
  },
  right_sep = { 'slant_right_2', ' ' },
  -- Uncomment the next line to disable file icons
  -- icon = ''
}

components.active[2][1] = {
  provider = 'diagnostic_errors',
  hl = {
    fg = 'red',
  },
}
components.active[2][2] = {
  provider = 'diagnostic_warnings',
  hl = {
    fg = 'yellow',
  },
}
components.active[2][3] = {
  provider = 'diagnostic_hints',
}

components.active[2][3] = {
  provider = '     ',
}

components.active[2][4] = {
  provider = 'git_diff_added',
  hl = {
    fg = 'green',
  },
}

components.active[2][5] = {
  provider = 'git_diff_changed',
  hl = {
    fg = 'blue',
  },
}

components.active[2][6] = {
  provider = 'git_diff_removed',
  hl = {
    fg = 'red',
  },
}
-- Component that shows file encoding
components.active[3][1] = {
  provider = 'file_encoding',
  hl = { fg = 'white', style = 'bold' },
  right_sep={' '},
}
components.active[3][2] = {
  provider = 'file_format',
  hl = { fg = 'white', style = 'bold' },
  left_sep = {
    {
      str = 'slant_left_2_thin',
      hl = { fg = 'white', style = 'bold' },
    },
    {
      str = ' ',
      hl = {
        fg = 'white',
      },
    },
  },
  right_sep={' '},
}
components.active[3][3] = {
  provider = 'file_type',
  hl = { fg = 'white', style = 'bold' },
  left_sep = {
    {
      str = 'slant_left_2_thin',
      hl = { fg = 'white', style = 'bold' },
    },
    {
      str = ' ',
      hl = {
        fg = 'white',
      },
    },
  },
  right_sep={' '},
}
components.active[3][4] = {
  provider = 'line_percentage',
  hl = {
    fg = 'white',
    bg = 'base03',
    style = 'bold',
  },
  left_sep = { 'slant_left_2' },
}
components.active[3][5] = {
  provider = 'position',
  hl = function()
    return {
      fg = 'white',
      bg = vi_mode.get_mode_color(),
      style = 'bold',
    }
  end,
  left_sep = {
    str = 'slant_left_2',
    hl = function()
      return {
        fg = vi_mode.get_mode_color(),
        bg = 'base03',
      }
    end,
  },
}

require('feline').setup({
  theme = colors,
  components = components,
  vi_mode_colors = vi_mode_colors,
})
require('feline').winbar.setup()
