local wezterm = require("wezterm")
local rose_pine = wezterm.plugin.require("https://github.com/neapsix/wezterm").moon

local M = {}

M.colors = rose_pine.colors()

function M.setup(config)
	config.colors = M.colors
	config.window_frame = rose_pine.window_frame()
end

return M

