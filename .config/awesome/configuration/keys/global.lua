local awful = require('awful')
require('awful.autofocus')
local beautiful = require('beautiful')
local hotkeys_popup = require('awful.hotkeys_popup').widget

local modkey = require('configuration.keys.mod').modKey
local altkey = require('configuration.keys.mod').altKey
local apps = require('configuration.apps')
-- Key bindings
local globalKeys = awful.util.table.join(awful.key({modkey}, 'F1', hotkeys_popup.show_help, {
    description = 'show help',
    group = 'awesome'
}), awful.key({modkey}, 'w', awful.tag.viewprev, {
    description = 'view previous',
    group = 'tag'
}), awful.key({modkey}, 's', awful.tag.viewnext, {
    description = 'view next',
    group = 'tag'
}), awful.key({modkey}, 'Escape', awful.tag.history.restore, {
    description = 'go back',
    group = 'tag'
}), awful.key({modkey}, 'd', function()
    awful.client.focus.byidx(1)
end, {
    description = 'focus next by index',
    group = 'client'
}), awful.key({modkey}, 'a', function()
    awful.client.focus.byidx(-1)
end, {
    description = 'focus previous by index',
    group = 'client'
}), awful.key({modkey}, 'r', function()
    _G.screen.primary.left_panel:toggle(true)
end, {
    description = 'open run menu',
    group = 'awesome'
}), awful.key({modkey}, '`', function()
    _G.screen.primary.left_panel:toggle(false)
end, {
    description = 'Show main menu',
    group = 'awesome'
}), awful.key({altkey}, 'space', function()
    _G.screen.primary.left_panel:toggle(true)
end, {
    description = 'show main menu',
    group = 'awesome'
}), awful.key({modkey}, 'u', awful.client.urgent.jumpto, {
    description = 'jump to urgent client',
    group = 'client'
}), awful.key({altkey}, 'Tab', function()
    -- awful.client.focus.history.previous()
    awful.client.focus.byidx(1)
    if _G.client.focus then
        _G.client.focus:raise()
    end
end, {
    description = 'Switch to next window',
    group = 'client'
}), awful.key({altkey, 'Shift'}, 'Tab', function()
    -- awful.client.focus.history.previous()
    awful.client.focus.byidx(-1)
    if _G.client.focus then
        _G.client.focus:raise()
    end
end, {
    description = 'Switch to previous window',
    group = 'client'
}), awful.key({modkey}, 'l', function()
    awful.spawn(apps.default.lock)
end, {
    description = 'Lock the screen',
    group = 'awesome'
}), awful.key({}, 'Print', function()
    awful.util.spawn_with_shell(apps.default.screenshot)
end, {
    description = 'Use flameshot to take a screenshot',
    group = 'screenshots'
}), awful.key({modkey}, 'c', function()
    awful.util.spawn(apps.default.editor)
end, {
    description = 'Open VSCODE',
    group = 'launcher'
}), awful.key({modkey}, 'b', function()
    awful.util.spawn(apps.default.browser)
end, {
    description = 'open Chrome',
    group = 'launcher'
}), awful.key({modkey}, 'x', function()
    awful.spawn(apps.default.terminal)
end, {
    description = 'open a terminal',
    group = 'launcher'
}), awful.key({modkey, 'Control'}, 'r', _G.awesome.restart, {
    description = 'reload awesome',
    group = 'awesome'
}), awful.key({modkey, 'Control'}, 'q', _G.awesome.quit, {
    description = 'quit awesome',
    group = 'awesome'
}), awful.key({altkey, 'Shift'}, 'Right', function()
    awful.tag.incmwfact(0.05)
end, {
    description = 'increase master width factor',
    group = 'layout'
}), awful.key({altkey, 'Shift'}, 'Left', function()
    awful.tag.incmwfact(-0.05)
end, {
    description = 'decrease master width factor',
    group = 'layout'
}), awful.key({altkey, 'Shift'}, 'Down', function()
    awful.client.incwfact(0.05)
end, {
    description = 'decrease master height factor',
    group = 'layout'
}), awful.key({altkey, 'Shift'}, 'Up', function()
    awful.client.incwfact(-0.05)
end, {
    description = 'increase master height factor',
    group = 'layout'
}), awful.key({modkey, 'Shift'}, 'Left', function()
    awful.tag.incnmaster(1, nil, true)
end, {
    description = 'increase the number of master clients',
    group = 'layout'
}), awful.key({modkey, 'Shift'}, 'Right', function()
    awful.tag.incnmaster(-1, nil, true)
end, {
    description = 'decrease the number of master clients',
    group = 'layout'
}), awful.key({modkey, 'Control'}, 'Left', function()
    awful.tag.incncol(1, nil, true)
end, {
    description = 'increase the number of columns',
    group = 'layout'
}), awful.key({modkey, 'Control'}, 'Right', function()
    awful.tag.incncol(-1, nil, true)
end, {
    description = 'decrease the number of columns',
    group = 'layout'
}), awful.key({modkey}, 'space', function()
    awful.layout.inc(1)
end, {
    description = 'select next',
    group = 'layout'
}), awful.key({modkey, 'Shift'}, 'space', function()
    awful.layout.inc(-1)
end, {
    description = 'select previous',
    group = 'layout'
}), awful.key({modkey, 'Control'}, 'n', function()
    local c = awful.client.restore()
    -- Focus restored client
    if c then
        _G.client.focus = c
        c:raise()
    end
end, {
    description = 'restore minimized',
    group = 'client'
}), awful.key({}, 'XF86MonBrightnessUp', function()
    awful.spawn('xbacklight -inc 10')
end, {
    description = '+10%',
    group = 'hotkeys'
}), awful.key({}, 'XF86MonBrightnessDown', function()
    awful.spawn('xbacklight -dec 10')
end, {
    description = '-10%',
    group = 'hotkeys'
}), awful.key({}, 'XF86AudioRaiseVolume', function()
    awful.spawn('amixer -D pulse sset Master 2%+')
end, {
    description = 'volume up',
    group = 'hotkeys'
}), awful.key({}, 'XF86AudioLowerVolume', function()
    awful.spawn('amixer -D pulse sset Master 2%-')
end, {
    description = 'volume down',
    group = 'hotkeys'
}), awful.key({}, 'XF86AudioMute', function()
    awful.spawn('amixer -D pulse set Master 1+ toggle')
end, {
    description = 'toggle mute',
    group = 'hotkeys'
}), awful.key({}, 'XF86AudioNext', function()
    --
end, {
    description = 'toggle mute',
    group = 'hotkeys'
}), awful.key({}, 'XF86PowerDown', function()
    --
end, {
    description = 'toggle mute',
    group = 'hotkeys'
}), awful.key({}, 'XF86PowerOff', function()
    _G.exit_screen_show()
end, {
    description = 'toggle mute',
    group = 'hotkeys'
}), awful.key({modkey}, 'o', awful.client.movetoscreen, {
    description = 'move window to next screen',
    group = 'client'
}), awful.key({modkey}, 't', function()
    awful.spawn(awful.screen.focused().selected_tag.defaultApp, {
        tag = _G.mouse.screen.selected_tag,
        placement = awful.placement.bottom_right
    })
end, {
    description = 'open default program for tag/workspace',
    group = 'tag'
}), awful.key({'Control', altkey}, 'space', function()
    awful.util.spawn_with_shell('vm-attach attach')
end), awful.key({modkey}, 'g', function()
    awful.util.spawn_with_shell('steam')
end), awful.key({modkey}, 'm', function()
    awful.util.spawn_with_shell('mate-system-monitor')
end), awful.key({modkey}, 'e', function()
    awful.util.spawn(apps.default.files)
end, {
    description = 'Default File Manager launch',
    group = 'hotkeys'
}))

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    -- Hack to only show tags 1 and 9 in the shortcut window (mod+s)
    local descr_view, descr_toggle, descr_move, descr_toggle_focus
    if i == 1 or i == 9 then
        descr_view = {
            description = 'view tag #',
            group = 'tag'
        }
        descr_toggle = {
            description = 'toggle tag #',
            group = 'tag'
        }
        descr_move = {
            description = 'move focused client to tag #',
            group = 'tag'
        }
        descr_toggle_focus = {
            description = 'toggle focused client on tag #',
            group = 'tag'
        }
    end
    globalKeys = awful.util.table.join(globalKeys, awful.key({modkey}, '#' .. i + 9, function()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
            tag:view_only()
        end
    end, descr_view), awful.key({modkey, 'Control'}, '#' .. i + 9, function()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
            awful.tag.viewtoggle(tag)
        end
    end, descr_toggle), awful.key({modkey, 'Shift'}, '#' .. i + 9, function()
        if _G.client.focus then
            local tag = _G.client.focus.screen.tags[i]
            if tag then
                _G.client.focus:move_to_tag(tag)
            end
        end
    end, descr_move), awful.key({modkey, 'Control', 'Shift'}, '#' .. i + 9, function()
        if _G.client.focus then
            local tag = _G.client.focus.screen.tags[i]
            if tag then
                _G.client.focus:toggle_tag(tag)
            end
        end
    end, descr_toggle_focus))
end

return globalKeys
