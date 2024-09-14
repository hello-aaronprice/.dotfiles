-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.colors = {
	foreground = "#d8d8d8",
	background = "#181818",
}

config.font = wezterm.font("0xProto Regular")
config.font_size = 10
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.9

-- and finally, return the configuration to wezterm
return config
