local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.enable_tab_bar = false
config.window_decorations = "RESIZE"

config.font_size = 14.0
config.line_height = 1.16
config.font = wezterm.font("SFMono Nerd Font", { weight = "Medium" })

-- match terminal to nvim github dark dimmed theme
config.colors = {
	background = "#22272E",
}

config.color_scheme = "GitHub Dark"

return config
