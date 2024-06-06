local act = require 'wezterm'.action

local keys = {
  {
    key = 'd',
    mods = 'CMD',
    action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'd',
    mods = 'CMD|SHIFT',
    action = act.SplitVertical { domain = 'CurrentPaneDomain' },
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
  {
    key = 'x',
    mods = 'CMD',
    action = act.CloseCurrentPane { confirm = false }
  },
  {
    key = 'h',
    mods = 'CMD',
    action = act.ActivatePaneDirection 'Left'
  },
  {
    key = 'j',
    mods = 'CMD',
    action = act.ActivatePaneDirection 'Down'
  },
  {
    key = 'k',
    mods = 'CMD',
    action = act.ActivatePaneDirection 'Up'
  },
  {
    key = 'l',
    mods = 'CMD',
    action = act.ActivatePaneDirection 'Right'
  },
  {
    key = 't',
    mods = 'CMD',
    action = act.SpawnTab 'CurrentPaneDomain'
  },
  {
    key = 'RightArrow',
    mods = 'CMD',
    action = act.ActivateTabRelative(1),
  },
  {
    key = 'LeftArrow',
    mods = 'CMD',
    action = act.ActivateTabRelative(-1),
  },
  {
    key = 'Enter',
    mods = 'CMD',
    action = act.ToggleFullScreen
  },
}

for i = 1, 10 do
  local keymap = {
    key = i % 10 .. '',
    mods = 'CMD',
    action = act.ActivateTab(i - 1),
  }
  table.insert(keys, keymap)
end

local config = {
  native_macos_fullscreen_mode = true,
  -- default_prog = { '/opt/homebrew/bin/tmux', 'new', '-A', '-s', 'main' },
  keys = keys,
}

return config
