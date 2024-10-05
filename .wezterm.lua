local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font_size = 16

config.font = wezterm.font("JetBrains Mono")

return config
