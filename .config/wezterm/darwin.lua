local act = require 'wezterm'.action
return {
  keys = {
    {
      key = 'd',
      mods = 'CMD',
      action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }
    },
    {
      key = 'd',
      mods = 'CMD|SHIFT',
      action = act.SplitVertical { domain = 'CurrentPaneDomain' }
    },
    {
      key = ']',
      mods = 'CMD',
      action = act.ActivatePaneDirection 'Next'
    },
    {
      key = '[',
      mods = 'CMD',
      action = act.ActivatePaneDirection 'Prev'
    },
  },
}
