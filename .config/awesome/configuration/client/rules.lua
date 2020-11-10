local awful = require('awful')
local gears = require('gears')
local client_keys = require('configuration.client.keys')
local client_buttons = require('configuration.client.buttons')

-- Rules
awful.rules.rules = {{
    rule = {},
    properties = {
        focus = awful.client.focus.filter,
        raise = true,
        keys = client_keys,
        buttons = client_buttons,
        screen = awful.screen.preferred,
        placement = awful.placement.no_offscreen,
        floating = false,
        maximized = false,
        above = false,
        below = false,
        ontop = false,
        sticky = false,
        maximized_horizontal = false,
        maximized_vertical = false,
        opacity = 0.95,
        tag = "8"
    }
}, {
    rule = {
        instance = "terminator"
    },
    properties = {
        screen = 1,
        tag = "5"
    }
}, {
    rule = {
        instance = "gimp"
    },
    properties = {
        screen = 1,
        tag = "8"
    }
}, {
    rule = {
        instance = "vivaldi-stable"
    },
    properties = {
        screen = 1,
        tag = "1",
        opacity = 1
    }
}, {
    rule = {
        instance = "chromium"
    },
    properties = {
        screen = 1,
        tag = "1",
        opacity = 1
    }
}, {
    rule = {
        instance = "google-chrome"
    },
    properties = {
        screen = 1,
        tag = "1",
        opacity = 1
    }
}, {
    rule = {
        instance = "discord"
    },
    properties = {
        screen = 1,
        tag = "3",
        opacity = 0.85
    }
}, {
    rule = {
        instance = "microsoft teams - preview"
    },
    properties = {
        screen = 1,
        tag = "3"
    }
}, {
    rule = {
        instance = "Steam"
    },
    properties = {
        screen = 1,
        tag = "7"
    }
}, {
    rule = {
        instance = "minecraft-launcher"
    },
    properties = {
        screen = 1,
        tag = "7"
    }
}, {
    rule = {
        instance = "Minecraft Launcher"
    },
    properties = {
        screen = 1,
        tag = "7"
    }
}, {
    rule = {
        instance = "nautilus"
    },
    properties = {
        screen = 1,
        tag = "4"
    }
}, {
    rule = {
        instance = "org.gnome.Nautilus"
    },
    properties = {
        screen = 1,
        tag = "4"
    }
}, {
    rule = {
        instance = "filezilla"
    },
    properties = {
        screen = 1,
        tag = "4"
    }
}, {
    rule = {
        instance = "file-roller"
    },
    properties = {
        screen = 1,
        tag = "4"
    }
}, {
    rule = {
        instance = "code - insiders"
    },
    properties = {
        screen = 1,
        tag = "2"
    }
}, {
    rule = {
        instance = "code-insiders"
    },
    properties = {
        screen = 1,
        tag = "2"
    }
}, {
    rule = {
        instance = "vlc"
    },
    properties = {
        screen = 1,
        tag = "6",
        opacity = 1
    }
}, {
    rule = {
        instance = "ts3client_linux_amd64"
    },
    properties = {
        screen = 1,
        tag = "3"
    }
}, {
    rule = {
        instance = "GitAhead"
    },
    properties = {
        screen = 1,
        tag = "4"
    }
}, {
    rule = {
        instance = "obs"
    },
    properties = {
        screen = 1,
        tag = "8",
        opacity = 1
    }
}, {
    rule = {
        tag = "8"
    },
    properties = {
        floating = true
    }
}, {
    rule_any = {
        name = {'QuakeTerminal'}
    },
    properties = {
        skip_decoration = true
    }
}, {
    rule_any = {
        type = {'dialog'},
        class = {'Wicd-client.py', 'calendar.google.com'}
    },
    properties = {
        placement = awful.placement.centered,
        ontop = true,
        floating = true,
        drawBackdrop = true,
        shape = function()
            return function(cr, w, h)
                gears.shape.rounded_rect(cr, w, h, 8)
            end
        end,
        skip_decoration = true
    }
}}
