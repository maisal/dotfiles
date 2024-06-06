local wezterm = require 'wezterm'

local function update_config(c1, c2)
  for k, v in pairs(c2) do
    if type(v) == 'table' then
      for i = 1, #v do
        if not (c1[k]) then
          c1[k] = {}
        end
        c1[k][#c1[k] + 1] = v[i]
      end
    else
      c1[k] = v
    end
  end
  return c1
end

local configs = {
  window_decorations = "RESIZE",
  hide_tab_bar_if_only_one_tab = true,
  color_scheme = "Oceanic-Next",
  window_background_opacity = 0.9,
  scrollback_lines = 10000,
  font = wezterm.font('JetBrainsMono Nerd Font', { weight = 'Regular' }),
}

if wezterm.target_triple:match 'darwin' then
  update_config(configs, require 'darwin')
end

return configs
