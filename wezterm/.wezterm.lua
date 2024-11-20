-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- config.color_scheme = 'Afterglow'
-- config.color_scheme = 'Github Dark (Gogh)'
config.color_scheme = "Rosé Pine (Gogh)"

config.colors = {
	foreground = "#d8d8d8",
	background = "#181818",
}

-- config.font = wezterm.font("MesloLGSDZ Nerd Font Mono")

config.font = wezterm.font("0xProto Nerd Font")
config.font = wezterm.font_with_fallback({
	"JetBrainsMono NFM",
	"Fira Code",
})
config.font_size = 9
config.enable_tab_bar = false
-- config.window_decorations = "RESIZE"
config.window_background_opacity = 0.9
return config
