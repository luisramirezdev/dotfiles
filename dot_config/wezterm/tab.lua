local wezterm = require("wezterm")

-- Define los colores directamente
local colors = {
	iris = "#c4a7e7",
	foam = "#9ccfd8",
	pine = "#31748f",
	gold = "#f6c177",
	rose = "#eb6f92",
	love = "#ebbcba",
	highlight_high = "#ffffff",
}

local Tab = {}

local function get_process(tab)
	local PROCESS_ICONS = {
		["docker"] = {
			{ Foreground = { Color = colors.iris } },
			{ Text = "󰡨" },
		},
		["nvim"] = {
			{ Foreground = { Color = colors.foam } },
			{ Text = "" },
		},
		["zsh"] = {
			{ Foreground = { Color = colors.pine } },
			{ Text = "" },
		},
		["bash"] = {
			{ Foreground = { Color = colors.pine } },
			{ Text = "" },
		},
		["node"] = {
			{ Foreground = { Color = colors.foam } },
			{ Text = "󰋘" },
		},
		["git"] = {
			{ Foreground = { Color = colors.pine } },
			{ Text = "󰊢" },
		},
		["lua"] = {
			{ Foreground = { Color = colors.iris } },
			{ Text = "" },
		},
	}

	local process_name = string.gsub(tab.active_pane.foreground_process_name, "(.*[/\\])(.*)", "%2")

	if PROCESS_ICONS[process_name] then
		return wezterm.format(PROCESS_ICONS[process_name])
	elseif process_name == "" then
		return wezterm.format({
			{ Foreground = { Color = colors.love } },
			{ Text = "󰌾" },
		})
	else
		return wezterm.format({
			{ Foreground = { Color = colors.iris } },
			{ Text = string.format("[%s]", process_name) },
		})
	end
end

local function get_current_working_dir(tab)
	local cwd_uri = tab.active_pane.current_working_dir

	if cwd_uri then
		local cwd = ""
		if type(cwd_uri) == "userdata" then
			cwd = cwd_uri.file_path
		else
			cwd_uri = cwd_uri:sub(8)
			local slash = cwd_uri:find("/")
			if slash then
				cwd = cwd_uri:sub(slash):gsub("%%(%x%x)", function(hex)
					return string.char(tonumber(hex, 16))
				end)
			end
		end

		if cwd == os.getenv("HOME") then
			return "~"
		end

		return string.format("%s", string.match(cwd, "[^/]+$"))
	end
end

function Tab.setup(config)
	config.tab_bar_at_bottom = true
	config.use_fancy_tab_bar = false
	config.show_new_tab_button_in_tab_bar = false
	config.tab_max_width = 50
	config.hide_tab_bar_if_only_one_tab = true

	wezterm.on("format-tab-title", function(tab)
		return wezterm.format({
			{ Text = " " },
			{ Attribute = { Intensity = "Half" } },
			{ Text = string.format("%s", tab.tab_index + 1) },
			"ResetAttributes",
			{ Text = " " },
			{ Text = get_process(tab) },
			{ Text = " " },
			{ Text = get_current_working_dir(tab) },
			{ Text = " " },
		})
	end)
end

return Tab
