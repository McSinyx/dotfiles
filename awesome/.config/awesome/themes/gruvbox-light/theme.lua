-- gruvbox awesome theme, light variant
-- Copyright (C) 2016-2019  Nguyễn Gia Phong
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

local theme = {}

-- Working directory (where you place this theme)
theme.wd = "~/.config/awesome/themes/gruvbox-light/"

theme.font          = "Latin Modern Mono Caps 12"
theme.hotkeys_font  = "Latin Modern Mono Bold 12"
theme.hotkeys_description_font = theme.font

theme.bg_normal     = "#fbf1c7"
theme.bg_focus      = "#ebdbb2"
theme.bg_urgent     = theme.bg_normal
theme.bg_minimize   = theme.bg_focus
theme.bg_systray    = theme.bg_normal
theme.hotkeys_bg    = theme.bg_normal

theme.fg_normal     = "#3c3836"
theme.fg_focus      = theme.fg_normal
theme.fg_urgent     = "#8f3f71"
theme.fg_minimize   = theme.fg_normal
theme.hotkeys_fg    = theme.fg_normal

theme.useless_gap   = 0
theme.border_width  = 2
theme.border_normal = theme.bg_focus
theme.border_focus  = "#b16286"
theme.border_marked = "#cc241d"

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
theme.taglist_squares_sel   = theme.wd .. "taglist/squaref.png"
theme.taglist_squares_unsel = theme.wd .. "taglist/square.png"

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = theme.wd .. "submenu.png"
theme.menu_height = 22
theme.menu_width  = 160

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = theme.wd .. "titlebar/normal.png"
theme.titlebar_close_button_focus = theme.wd .. "titlebar/close.png"

theme.titlebar_minimize_button_normal = theme.wd .. "titlebar/normal.png"
theme.titlebar_minimize_button_focus = theme.wd .. "titlebar/minimize.png"

theme.titlebar_ontop_button_normal_inactive = theme.wd .. "titlebar/normal.png"
theme.titlebar_ontop_button_focus_inactive = theme.wd .. "titlebar/ontop_inactive.png"
theme.titlebar_ontop_button_normal_active = theme.wd .. "titlebar/normal.png"
theme.titlebar_ontop_button_focus_active = theme.wd .. "titlebar/ontop_active.png"

theme.titlebar_sticky_button_normal_inactive = theme.wd .. "titlebar/normal.png"
theme.titlebar_sticky_button_focus_inactive = theme.wd .. "titlebar/sticky_inactive.png"
theme.titlebar_sticky_button_normal_active = theme.wd .. "titlebar/normal.png"
theme.titlebar_sticky_button_focus_active = theme.wd .. "titlebar/sticky_active.png"

theme.titlebar_floating_button_normal_inactive = theme.wd .. "titlebar/normal.png"
theme.titlebar_floating_button_focus_inactive = theme.wd .. "titlebar/floating_inactive.png"
theme.titlebar_floating_button_normal_active = theme.wd .. "titlebar/normal.png"
theme.titlebar_floating_button_focus_active = theme.wd .. "titlebar/floating_active.png"

theme.titlebar_maximized_button_normal_inactive = theme.wd .. "titlebar/normal.png"
theme.titlebar_maximized_button_focus_inactive = theme.wd .. "titlebar/maximized_inactive.png"
theme.titlebar_maximized_button_normal_active = theme.wd .. "titlebar/normal.png"
theme.titlebar_maximized_button_focus_active = theme.wd .. "titlebar/maximized_active.png"

--theme.wallpaper = theme.wd .. "background.png"

-- You can use your own layout icons like this:
theme.layout_fairh = theme.wd .. "layouts/fairh.png"
theme.layout_fairv = theme.wd .. "layouts/fairv.png"
theme.layout_floating  = theme.wd .. "layouts/floating.png"
theme.layout_magnifier = theme.wd .. "layouts/magnifier.png"
theme.layout_max = theme.wd .. "layouts/max.png"
theme.layout_fullscreen = theme.wd .. "layouts/fullscreen.png"
theme.layout_tilebottom = theme.wd .. "layouts/tilebottom.png"
theme.layout_tileleft   = theme.wd .. "layouts/tileleft.png"
theme.layout_tile = theme.wd .. "layouts/tile.png"
theme.layout_tiletop = theme.wd .. "layouts/tiletop.png"
theme.layout_spiral  = theme.wd .. "layouts/spiral.png"
theme.layout_dwindle = theme.wd .. "layouts/dwindle.png"
theme.layout_cornernw = theme.wd .. "layouts/cornernw.png"
theme.layout_cornerne = theme.wd .. "layouts/cornerne.png"
theme.layout_cornersw = theme.wd .. "layouts/cornersw.png"
theme.layout_cornerse = theme.wd .. "layouts/cornerse.png"

theme.awesome_icon = theme.wd .. "awesome.png"

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

-- Arrows
theme.arrow0 = theme.wd .. "arrows/0.png"
theme.arrow1 = theme.wd .. "arrows/1.png"
theme.arrow2 = theme.wd .. "arrows/2.png"
theme.arrow3 = theme.wd .. "arrows/3.png"
theme.arrow4 = theme.wd .. "arrows/4.png"
theme.arrow5 = theme.wd .. "arrows/5.png"
theme.arrow6 = theme.wd .. "arrows/6.png"

return theme
