canvas = require("hs.canvas")
st = require("hs.styledtext")

local function reload_config(files)
	hs.reload()
end

hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reload_config):start()
hs.alert.show("Config loaded")

local letters = { "A", "S", "D", "F", "G", "H", "J", "K", "L" }
local canvases = {}
local windows = {}

local font_attrs = {
	font = { name = "Iosevka", size = 60 },
	color = { red = 1.0 },
	strokeColor = { white = 1.0 },
	strokeWidth = -2.0,
}

local function prepare_window_canvas(x, y, letter)
	local c = canvas.new({ x = x + 10, y = y, h = 90, w = 90 })
	c[1] = {
		frame = { h = 90, w = 90, x = 0, y = 0 },
		text = st.new(string.lower(letter), font_attrs),
		type = "text",
	}
	return c
end

local function prepare_state()
	local index = 1
	local canvases, windows = {}, {}
	local windows = hs.window.visibleWindows()
	for _, window in ipairs(windows) do
		local title = window:title()
		if string.len(title) > 0 then
			local letter = letters[index]
			local top_left = window:topLeft()
			local x = top_left.x
			local y = top_left.y
			canvases[letter] = prepare_window_canvas(x, y, letter)
			windows[letter] = window
			index = index + 1
		end
	end
	return canvases, windows
end

local function cleanup()
	-- remove letters
	for _, letter in ipairs(letters) do
		local c = canvases[letter]
		if c then
			c:hide()
		end
	end
end

local function focus_window(letter, modal)
	return function()
		local w = windows[letter]
		if w then
			w:focus()
		end
		cleanup()
		modal:exit()
	end
end

local poor_man_ace_window = hs.hotkey.modal.new({ "alt", "ctrl" }, "o")
poor_man_ace_window:bind("ctrl", "g", "", function()
	cleanup()
	poor_man_ace_window:exit()
end)

for _, letter in ipairs(letters) do
	poor_man_ace_window:bind("", letter, nil, focus_window(letter, poor_man_ace_window))
end

function poor_man_ace_window:entered()
	canvases, windows = prepare_state()
	-- draw letters
	for _, letter in ipairs(letters) do
		local c = canvases[letter]
		if c then
			c:show()
		end
	end
end
