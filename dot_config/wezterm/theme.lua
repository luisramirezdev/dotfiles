local wezterm = require("wezterm")

-- Usa el plugin oficial desde GitHub
local rose_pine = wezterm.plugin.require("https://github.com/neapsix/wezterm").moon
-- Puedes cambiar `.moon` por `.main` o `.dawn`

local M = {}

function M.setup(config)
	config.colors = rose_pine.colors()
	config.window_frame = rose_pine.window_frame()
end

return M
