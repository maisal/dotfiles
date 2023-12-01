local act = require 'wezterm'.action
local TMUX_PREFIX = act.SendKey { key = 't', mods = 'CTRL' }

return {
  native_macos_fullscreen_mode = true,
  default_prog = { '/opt/homebrew/bin/tmux', 'new', '-A', '-s', 'main' },
  keys = {
    {
      key = 'd',
      mods = 'CMD',
      action = act.Multiple {
        TMUX_PREFIX,
        act.SendKey { key = [[\]] },
      }
    },
    {
      key = 'd',
      mods = 'CMD|SHIFT',
      action = act.Multiple {
        TMUX_PREFIX,
        act.SendKey { key = '-' },
      }
    },
    {
      key = ']',
      mods = 'CMD',
      action = act.Multiple {
        TMUX_PREFIX,
        act.SendKey { key = 'o' },
      }
    },
    {
      key = '[',
      mods = 'CMD',
      action = act.Multiple {
        TMUX_PREFIX,
        act.SendKey { key = 'O' },
      }
    },
    {
      key = 'x',
      mods = 'CMD',
      action = act.Multiple {
        TMUX_PREFIX,
        act.SendKey { key = 'x' },
      }
    },
    {
      key = 'h',
      mods = 'CMD',
      action = act.Multiple {
        TMUX_PREFIX,
        act.SendKey { key = 'h' },
      }
    },
    {
      key = 'j',
      mods = 'CMD',
      action = act.Multiple {
        TMUX_PREFIX,
        act.SendKey { key = 'j' },
      }
    },
    {
      key = 'k',
      mods = 'CMD',
      action = act.Multiple {
        TMUX_PREFIX,
        act.SendKey { key = 'k' },
      }
    },
    {
      key = 'l',
      mods = 'CMD',
      action = act.Multiple {
        TMUX_PREFIX,
        act.SendKey { key = 'l' },
      }
    },
    {
      key = 'Enter',
      mods = 'CMD',
      action = act.ToggleFullScreen
    },
  },
}
