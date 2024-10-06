local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.enable_tab_bar = false

config.window_background_opacity = 0.93
config.macos_window_background_blur = 30
config.window_decorations = "RESIZE"

config.font_size = 16
config.font = wezterm.font("JetBrains Mono")

return config
