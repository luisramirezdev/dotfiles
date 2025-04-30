local wezterm = require("wezterm")

local Fonts = {}

function Fonts.setup(config)
	local primary_font = "JetBrains Mono"

	config.font = wezterm.font_with_fallback({
		primary_font,
		"Apple Color Emoji",
	})

	config.font_rules = {
		{
			intensity = "Bold",
			italic = true,
			font = wezterm.font_with_fallback({
				{
					family = primary_font,
					weight = "Bold",
					italic = true,
				},
			}),
		},
		{
			intensity = "Normal",
			italic = true,
			font = wezterm.font_with_fallback({
				{
					family = primary_font,
					italic = true,
				},
			}),
		},
		{
			intensity = "Half",
			italic = true,
			font = wezterm.font_with_fallback({
				{
					family = primary_font,
					weight = "Light",
					italic = true,
				},
			}),
		},
	}
	config.font_size = 14.5
	config.underline_thickness = "200%"
	config.underline_position = "-3pt"
	config.line_height = 1.3
end

return Fonts
