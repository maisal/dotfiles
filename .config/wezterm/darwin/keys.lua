local act = require 'wezterm'.action
local TMUX_PREFIX = act.SendKey { key = 't', mods = 'CTRL' }

local keys = {
  {
    -- ToggleFullScreen
    key = 'Enter',
    mods = 'CMD|SHIFT',
    action = act.ToggleFullScreen
  },
  {
    -- ToggleFullScreen
    key = 'Enter',
    mods = 'CMD',
    action = act.TogglePaneZoomState
  },
  {
    -- Split Horizontally
    key = 'd',
    mods = 'CMD',
    action = act.SplitHorizontal {
      domain = 'CurrentPaneDomain'
    }
  },
  {
    -- Split Vertically
    key = 'd',
    mods = 'CMD|SHIFT',
    action = act.SplitVertical {
      domain = 'CurrentPaneDomain'
    }
  },
  {
    -- Next Pane
    key = ']',
    mods = 'CMD',
    action = act.ActivatePaneDirection "Next"
  },
  {
    -- Previous Pane
    key = '[',
    mods = 'CMD',
    action = act.ActivatePaneDirection "Prev"
  },
  {
    -- Kill the Current Pane
    key = 'x',
    mods = 'CMD',
    action = act.CloseCurrentPane {
      confirm = false
    }
  },
  {
    -- Active Pane Right
    key = 'h',
    mods = 'CMD',
    action = act.ActivatePaneDirection "Left"
  },
  {
    -- Active Pane Down
    key = 'j',
    mods = 'CMD',
    action = act.ActivatePaneDirection "Down"
  },
  {
    -- Active Pane Up
    key = 'k',
    mods = 'CMD',
    action = act.ActivatePaneDirection "Up"
  },
  {
    -- Active Pane Left
    key = 'l',
    mods = 'CMD',
    action = act.ActivatePaneDirection "Right"
  },
  {
    -- New Tab (tmux window)
    key = 't',
    mods = 'CMD',
    action = act.SpawnTab "DefaultDomain"
  },
}

-- Select Tab
for i = 1, 9 do
  table.insert(keys,
    {
      key = i .. '',
      mods = 'CMD',
      action = act.ActivateTab(i - 1),
    }
  )
end

-- Select Layout
for i = 1, 9 do
  table.insert(keys,
    {
      key = i .. '',
      mods = 'CMD|ALT',
      action = act.ActivateTab(i - 1),
    }
  )
end

return keys
