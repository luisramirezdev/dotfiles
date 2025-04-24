local wezterm = require("wezterm")

local Fonts = {}

function Fonts.setup(config)
	config.font = wezterm.font_with_fallback({
		"Fira Code",
		"Apple Color Emoji",
	})

	config.font_rules = {
		{
			intensity = "Bold",
			italic = true,
			font = wezterm.font_with_fallback({
				{
					family = "Fira Code",
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
					family = "Fira Code",
					italic = true,
				},
			}),
		},
		{
			intensity = "Half",
			italic = true,
			font = wezterm.font_with_fallback({
				{
					family = "Fira Code",
					weight = "Light",
					italic = true,
				},
			}),
		},
	}
	config.font_size = 14
	config.underline_thickness = "200%"
	config.underline_position = "-3pt"
	config.line_height = 1.6
end

return Fonts
