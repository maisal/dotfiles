local wezterm = require 'wezterm'
local act = wezterm.action

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
  hyperlink_rules = {
    -- Linkify things that look like URLs and the host has a TLD name.
    -- Compiled-in default. Used if you don't specify any hyperlink_rules.
    {
      regex = '\\b\\w+://[\\w.-]+\\.[a-z]{2,15}\\S*\\b',
      format = '$0',
    },

    -- linkify email addresses
    -- Compiled-in default. Used if you don't specify any hyperlink_rules.
    {
      regex = [[\b\w+@[\w-]+(\.[\w-]+)+\b]],
      format = 'mailto:$0',
    },

    -- file:// URI
    -- Compiled-in default. Used if you don't specify any hyperlink_rules.
    {
      regex = [[\bfile://\S*\b]],
      format = '$0',
    },

    -- Linkify things that look like URLs with numeric addresses as hosts.
    -- E.g. http://127.0.0.1:8000 for a local development server,
    -- or http://192.168.1.1 for the web interface of many routers.
    {
      regex = [[\b\w+://(?:[\d]{1,3}\.){3}[\d]{1,3}\S*\b]],
      format = '$0',
    },
  },
}

if wezterm.target_triple:match 'darwin' then
  update_config(configs, require 'darwin')
end

return configs
