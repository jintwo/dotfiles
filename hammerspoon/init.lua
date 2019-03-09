-- hammerspoon prefix
local prefix = {'cmd', 'ctrl'}
local s_prefix = {'shift', 'cmd', 'ctrl'}

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

local function default_screen_mode()
    local screen = hs.screen.mainScreen()
    screen:setMode(1440, 900, 2)
end

local function daw_screen_mode()
    local screen = hs.screen.mainScreen()
    screen:setMode(1920, 1200, 2)
end

local function focus_window(dir)
    local function capitalize(s)
        return (s:gsub("^%l", string.upper))
    end
    local method = 'focusWindow' .. capitalize(dir)
    return function ()
        local win = hs.window.focusedWindow()
        if win then
            win[method](win)
        else
            hs.alert.show('Shi...')
        end
    end
end

hs.hotkey.bind(prefix, 'left', left_half)
hs.hotkey.bind(prefix, 'right', right_half)
hs.hotkey.bind(prefix, 'up', full)
hs.hotkey.bind(prefix, 'l', focus_window('east'))
hs.hotkey.bind(prefix, 'h', focus_window('west'))
hs.hotkey.bind(prefix, 'j', focus_window('south'))
hs.hotkey.bind(prefix, 'k', focus_window('north'))

-- set screen mode
hs.hotkey.bind(prefix, 'w', daw_screen_mode)
hs.hotkey.bind(s_prefix, 'w', default_screen_mode)
