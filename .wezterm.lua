local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.enable_tab_bar = false
config.window_decorations = "RESIZE"

config.font_size = 16
config.font = wezterm.font("MonoLisa", { weight = "Book" })
-- config.font = wezterm.font({ family = "Monaspace Argon Var", weight = "Bold" })

config.color_scheme = "GitHub Dark"

return config
