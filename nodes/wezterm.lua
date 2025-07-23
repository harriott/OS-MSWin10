
-- Joseph Harriott - lun 21 avr 2025
-- $MSn/wezterm.lua ($MSn/set/3.ps1)

local wezterm = require 'wezterm'
local config = wezterm.config_builder()

  config.color_scheme = 'AlienBlood'
  config.default_prog = { 'pwsh.exe' }
  config.font_size = 9.0
  config.use_dead_keys = false
  config.window_background_opacity = 0.85
  config.initial_cols = 106
  config.initial_rows = 55

return config

