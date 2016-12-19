-- hammerspoon prefix
local prefix = {'cmd', 'ctrl'}

-- utils
function reload_config(files)
    hs.reload()
end

hs.pathwatcher.new(os.getenv('HOME') .. '/.hammerspoon/', reload_config):start()
hs.alert.show('Config loaded')

-- window manipulation routines
local function get_screen_frame(w)
    local screen = nil
    if not w then
        screen = hs.screen.mainScreen()
    else
        screen = w:screen()
    end
    return screen:frame()
end

local function left_half()
    local win = hs.window.focusedWindow()
    local frame = win:frame()
    local max = get_screen_frame(win)
    frame.x = max.x
    frame.y = max.y
    frame.w = max.w / 2
    frame.h = max.h
    win:setFrame(frame)
end

local function right_half()
    local win = hs.window.focusedWindow()
    local frame = win:frame()
    local max = get_screen_frame(win)
    frame.w = max.w / 2
    frame.x = max.x + frame.w
    frame.y = max.y
    frame.h = max.h
    win:setFrame(frame)
end

local function full()
    local win = hs.window.focusedWindow()
    win:setFrame(get_screen_frame(win))
end

hs.hotkey.bind(prefix, 'left', left_half)
hs.hotkey.bind(prefix, 'right', right_half)
hs.hotkey.bind(prefix, 'up', full)
