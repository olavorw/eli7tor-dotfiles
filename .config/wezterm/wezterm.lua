local wezterm = require("wezterm")
local config = {}

-- Use config builder if available
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Set the Catppuccin Mocha color scheme
config.color_scheme = "Catppuccin Mocha"

-- Set your font
config.font = wezterm.font("JetBrains Mono Nerd Font")
config.font_size = 11.0

-- The acrylic background effect!
-- Opacity for the window background, not the text
config.window_background_opacity = 0.85

-- Padding
config.window_padding = {
  left = 10,
  right = 10,
  top = 10,
  bottom = 10,
}

-- Hide the tab bar when there's only one tab
config.hide_tab_bar_if_only_one_tab = true

return config
