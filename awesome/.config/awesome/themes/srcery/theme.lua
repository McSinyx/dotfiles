-- srcery awesome theme
-- Copyright (C) 2019  Nguyễn Gia Phong
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.

local gears = require'gears'

local theme = {}
-- Working directory (where you place this theme)
local wd = '~/.config/awesome/themes/srcery/'
local function abspath(relative) return wd .. relative end

theme.font          = 'Latin Modern Mono Caps 12'
theme.hotkeys_font  = 'Latin Modern Mono Bold 12'
theme.hotkeys_description_font = theme.font

-- Auxiliary colors
theme.black   = '#1c1b19'
theme.gray    = '#2d2c29'
theme.red     = '#ef2f27'
theme.orange  = '#ff5f00'
theme.yellow  = '#fbb829'
theme.green   = '#519f50'
theme.cyan    = '#0aaeb3'
theme.blue    = '#2c78bf'
theme.magenta = '#e02c6d'
theme.grey    = '#918175'
theme.white   = '#fce8c3'

theme.bg_normal     = theme.black
theme.bg_focus      = theme.gray
theme.bg_urgent     = theme.bg_normal
theme.bg_minimize   = theme.bg_focus
theme.bg_systray    = theme.bg_normal
theme.hotkeys_bg    = theme.bg_normal

theme.fg_normal     = theme.white
theme.fg_focus      = theme.fg_normal
theme.fg_urgent     = theme.grey
theme.fg_minimize   = theme.fg_normal
theme.hotkeys_fg    = theme.fg_normal

theme.useless_gap   = 0
theme.border_width  = 2
theme.border_normal = '#353535'
theme.border_focus  = theme.orange
theme.border_marked = theme.red

theme.hotkeys_border_color = theme.border_focus
theme.hotkeys_border_width = theme.border_width
theme.hotkeys_modifiers_fg = theme.fg_urgent

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
theme.titlebar_bg_normal = theme.bg_normal
theme.titlebar_bg_focus = theme.bg_normal

-- Display the taglist squares
theme.taglist_squares_sel   = abspath'taglist/squaref.png'
theme.taglist_squares_unsel = abspath'taglist/square.png'

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = abspath'submenu.png'
theme.menu_height = 22
theme.menu_width  = 160

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = '#cc0000'

-- Define the image to load
local function titlebar(button)
  return abspath('titlebar/' .. button .. '.png')
end
theme.titlebar_close_button_normal = titlebar'normal'
theme.titlebar_close_button_focus = titlebar'close'

theme.titlebar_minimize_button_normal = titlebar'normal'
theme.titlebar_minimize_button_focus = titlebar'minimize'

theme.titlebar_ontop_button_normal_inactive = titlebar'normal'
theme.titlebar_ontop_button_focus_inactive = titlebar'ontop_inactive'
theme.titlebar_ontop_button_normal_active = titlebar'normal'
theme.titlebar_ontop_button_focus_active = titlebar'ontop_active'

theme.titlebar_sticky_button_normal_inactive = titlebar'normal'
theme.titlebar_sticky_button_focus_inactive = titlebar'sticky_inactive'
theme.titlebar_sticky_button_normal_active = titlebar'normal'
theme.titlebar_sticky_button_focus_active = titlebar'sticky_active'

theme.titlebar_floating_button_normal_inactive = titlebar'normal'
theme.titlebar_floating_button_focus_inactive = titlebar'floating_inactive'
theme.titlebar_floating_button_normal_active = titlebar'normal'
theme.titlebar_floating_button_focus_active = titlebar'floating_active'

theme.titlebar_maximized_button_normal_inactive = titlebar'normal'
theme.titlebar_maximized_button_focus_inactive = titlebar'maximized_inactive'
theme.titlebar_maximized_button_normal_active = titlebar'normal'
theme.titlebar_maximized_button_focus_active = titlebar'maximized_active'

-- Desktop background
function theme.wallpaper() gears.wallpaper.set(theme.black) end

-- You can use your own layout icons like this:
local function layout(icon)
  return abspath('layouts/' .. icon .. '.png')
end
theme.layout_fairh = layout'fairh'
theme.layout_fairv = layout'fairv'
theme.layout_floating  = layout'floating'
theme.layout_magnifier = layout'magnifier'
theme.layout_max = layout'max'
theme.layout_fullscreen = layout'fullscreen'
theme.layout_tilebottom = layout'tilebottom'
theme.layout_tileleft   = layout'tileleft'
theme.layout_tile = layout'tile'
theme.layout_tiletop = layout'tiletop'
theme.layout_spiral  = layout'spiral'
theme.layout_dwindle = layout'dwindle'
theme.layout_cornernw = layout'cornernw'
theme.layout_cornerne = layout'cornerne'
theme.layout_cornersw = layout'cornersw'
theme.layout_cornerse = layout'cornerse'

theme.awesome_icon = abspath'awesome.png'

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

-- Arrows
theme.arrow0 = abspath'arrows/0.png'
theme.arrow1 = abspath'arrows/1.png'
theme.arrow2 = abspath'arrows/2.png'
theme.arrow3 = abspath'arrows/3.png'
theme.arrow4 = abspath'arrows/4.png'
theme.arrow5 = abspath'arrows/5.png'
theme.arrow6 = abspath'arrows/6.png'

return theme
