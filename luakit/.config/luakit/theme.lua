-- srcery luakit theme
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

local theme = {}
local color = {black = '#1C1B19', red = '#EF2F27', green = '#519F50',
               yellow = '#FBB829', blue = '#2C78BF', magenta = '#E02C6D',
               cyan = '#0AAEB3', white = '#918175', orange = '#ff5f00',
               brightblack = '#2D2C29', brightred = '#F75341',
               brightgreen = '#98BC37', brightyellow = '#FED06E',
               brightblue = '#68A8E4', brightmagenta = '#FF5C8F',
               brightcyan = '#53FDE9', brightwhite = '#FCE8C3'}


-- Default settings
theme.font = '12pt Latin Modern Mono'
theme.fg   = color.brightwhite
theme.bg   = color.black

-- General colours
theme.success_fg = color.brightgreen
theme.loaded_fg  = color.brightblue
theme.error_fg = theme.fg
theme.error_bg = color.red

-- Warning colours
theme.warning_fg = color.red
theme.warning_bg = theme.bg

-- Notification colours
theme.notif_fg = color.yellow
theme.notif_bg = theme.bg

-- Menu colours
theme.menu_fg                   = theme.fg
theme.menu_bg                   = color.brightblack
theme.menu_selected_fg          = theme.menu_fg
theme.menu_selected_bg          = color.magenta
theme.menu_title_bg             = theme.menu_bg
theme.menu_primary_title_fg     = color.green
theme.menu_secondary_title_fg   = color.cyan

theme.menu_disabled_fg = color.white
theme.menu_disabled_bg = theme.menu_bg
theme.menu_enabled_fg = theme.menu_fg
theme.menu_enabled_bg = theme.menu_bg
theme.menu_active_fg = color.red
theme.menu_active_bg = theme.menu_bg

-- Proxy manager
theme.proxy_active_menu_fg      = theme.fg
theme.proxy_active_menu_bg      = theme.bg
theme.proxy_inactive_menu_fg    = color.green
theme.proxy_inactive_menu_bg    = theme.bg

-- Statusbar specific
theme.sbar_fg         = theme.fg
theme.sbar_bg         = theme.bg

-- Downloadbar specific
theme.dbar_fg         = theme.fg
theme.dbar_bg         = theme.bg
theme.dbar_error_fg   = color.brightred

-- Input bar specific
theme.ibar_fg           = theme.fg
theme.ibar_bg           = theme.bg

-- Tab label
theme.tab_fg            = theme.fg
theme.tab_bg            = color.brightblack
theme.tab_hover_bg      = color.orange
theme.tab_ntheme        = color.white
theme.selected_fg       = theme.fg
theme.selected_bg       = theme.bg
theme.selected_ntheme   = color.white
theme.loading_fg        = theme.loaded_fg
theme.loading_bg        = theme.loaded_bg

theme.selected_private_tab_bg = color.brightmagenta
theme.private_tab_bg          = color.magenta

-- Trusted/untrusted ssl colours
theme.trust_fg          = color.brightgreen
theme.notrust_fg        = color.brightred

-- General colour pairings
theme.ok = {fg = theme.fg, bg = theme.bg}
theme.warn = {fg = color.brightred, bg = theme.bg}
theme.error = {fg = theme.fg, bg = color.red}

return theme
