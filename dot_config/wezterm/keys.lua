local wezterm = require("wezterm")

local Keys = {}

local function is_vi_process(pane)
	return pane:get_foreground_process_name():find("n?vim") ~= nil
end

local direction_keys = {
	Left = "h",
	Down = "j",
	Up = "k",
	Right = "l",
	h = "Left",
	j = "Down",
	k = "Up",
	l = "Right",
}

local function split_nav(resize_or_move, key)
	return {
		key = key,
		mods = resize_or_move == "resize" and "SHIFT|ALT" or "ALT",
		action = wezterm.action_callback(function(win, pane)
			if is_vi_process(pane) then
				win:perform_action({
					SendKey = { key = key, mods = resize_or_move == "resize" and "SHIFT|ALT" or "ALT" },
				}, pane)
			else
				if resize_or_move == "resize" then
					win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
				else
					win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
				end
			end
		end),
	}
end

function Keys.setup(config)
	config.disable_default_key_bindings = true
	config.keys = {

		-- ── Tab Management ─────────────────────────────────────
		{ key = "n", mods = "ALT", action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
		{ key = "Q", mods = "ALT", action = wezterm.action({ CloseCurrentTab = { confirm = false } }) },
		{ key = "RightArrow", mods = "ALT|SHIFT", action = wezterm.action.ActivateTabRelative(1) },
		{ key = "LeftArrow", mods = "ALT|SHIFT", action = wezterm.action.ActivateTabRelative(-1) },

		-- ── Pane Management ────────────────────────────────────
		{ key = "q", mods = "ALT", action = wezterm.action.CloseCurrentPane({ confirm = false }) },

		-- Split horizontal (divide a la derecha)
		{
			key = "|",
			mods = "ALT|SHIFT",
			action = wezterm.action({
				SplitHorizontal = { domain = "CurrentPaneDomain" },
			}),
		},

		-- Split vertical (divide abajo)
		{
			key = "-",
			mods = "ALT",
			action = wezterm.action({
				SplitVertical = { domain = "CurrentPaneDomain" },
			}),
		},

		-- ── Clipboard ──────────────────────────────────────────
		{ key = "c", mods = "CMD", action = wezterm.action({ CopyTo = "Clipboard" }) },
		{ key = "v", mods = "CMD", action = wezterm.action({ PasteFrom = "Clipboard" }) },

		-- ── Save (Ctrl+S equiv) ───────────────────────────────
		{
			key = "s",
			mods = "SUPER",
			action = wezterm.action({ SendString = "\x13" }), -- Ctrl+S
		},

		-- ── Font Size ──────────────────────────────────────────
		{ key = "=", mods = "CTRL", action = wezterm.action.IncreaseFontSize },
		{ key = "-", mods = "CTRL", action = wezterm.action.DecreaseFontSize },
	}
end

return Keys
