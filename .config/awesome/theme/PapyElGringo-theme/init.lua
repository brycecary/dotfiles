local filesystem = require('gears.filesystem')
local mat_colors = require('theme.mat-colors')
local theme_dir = filesystem.get_configuration_dir() .. '/theme'
local dpi = require('beautiful').xresources.apply_dpi

local theme = {}
theme.icons = theme_dir .. '/icons/'
theme.font = 'Roboto medium 10'

-- Colors Pallets

-- Primary
theme.primary = mat_colors.red

-- Accent
theme.accent = mat_colors.orange

-- Background
theme.background = mat_colors.grey

local awesome_overrides = function(theme)
    --
end
return {
    theme = theme,
    awesome_overrides = awesome_overrides
}
