canvas = require("hs.canvas")

local function reload_config(files)
    hs.reload()
end

hs.pathwatcher.new(os.getenv('HOME') .. '/.hammerspoon/', reload_config):start()
hs.alert.show('Config loaded')

local letters = {'A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'}
local poor_man_ace_window = hs.hotkey.modal.new({'alt', 'ctrl'}, 'o')
local canvases = {}
local window_letter_map = {}

local function prepare_window_canvas(window, letter)
    local top_left = window:topLeft()
    local c = canvas.new{x = top_left.x + 10, y = top_left.y, h = 50, w = 50}
    c[1] = {
        frame = { h = 50, w = 50, x = 0, y = 0 },
        textSize = 50,
        textColor = { red = 1.0 },
        text = letter,
        type = 'text',
    }
    return c
end

local function fill_window_letter_map()
    local index = 1
    local windows = hs.window.visibleWindows()
    for _, window in ipairs(windows) do
        local title = window:title()
        if string.len(title) > 0 then
            local letter = letters[index]
            canvases[letter] = prepare_window_canvas(window, letter)
            window_letter_map[letter] = window
            index = index + 1
        end
    end
end

local function focus_window(letter)
    return function()
        window_letter_map[letter]:focus()
        canvases[letter]:hide()
        poor_man_ace_window:exit()
    end
end

function poor_man_ace_window:entered()
    canvases = {}
    window_letter_map = {}

    fill_window_letter_map()
    for _, letter in ipairs(letters) do
        poor_man_ace_window:bind('', letter, nil, focus_window(letter))
        local c = canvases[letter]
        if c then
            c:show()
        end
    end
end

function poor_man_ace_window:exited()
    for _, letter in ipairs(letters) do
        local c = canvases[letter]
        if c then
            c:hide()
        end
    end
end

poor_man_ace_window:bind('ctrl', 'g', '', function() poor_man_ace_window:exit() end)
poor_man_ace_window:exit()
