--------------------------------
-- Light gruvbox luakit theme --
-------------------------------

local theme = {}

-- Default settings
theme.font = "12pt Latin Modern Mono"
theme.fg   = "#3c3836"
theme.bg   = "#fbf1c7"

-- General colours
theme.success_fg = "#79740e"
theme.loaded_fg  = "#076678"
theme.error_fg = theme.fg
theme.error_bg = "#cc241d"

-- Warning colours
theme.warning_fg = "9d0006"
theme.warning_bg = theme.bg

-- Notification colours
theme.notif_fg = "#7c6f64"
theme.notif_bg = theme.bg

-- Menu colours
theme.menu_fg                   = theme.fg
theme.menu_bg                   = "#d5c4a1"
theme.menu_selected_fg          = theme.menu_bg
theme.menu_selected_bg          = "#076678"
theme.menu_title_bg             = "#ebdbb2"
theme.menu_primary_title_fg     = theme.fg
theme.menu_secondary_title_fg   = theme.fg

theme.menu_disabled_fg = "#928374"
theme.menu_disabled_bg = theme.menu_bg
theme.menu_enabled_fg = theme.menu_fg
theme.menu_enabled_bg = theme.menu_bg
theme.menu_active_fg = "#79740e"
theme.menu_active_bg = theme.menu_bg

-- Proxy manager
theme.proxy_active_menu_fg      = theme.fg
theme.proxy_active_menu_bg      = theme.bg
theme.proxy_inactive_menu_fg    = '#928374'
theme.proxy_inactive_menu_bg    = theme.bg

-- Statusbar specific
theme.sbar_fg         = theme.fg
theme.sbar_bg         = theme.bg

-- Downloadbar specific
theme.dbar_fg         = theme.fg
theme.dbar_bg         = theme.bg
theme.dbar_error_fg   = "#9d0006"

-- Input bar specific
theme.ibar_fg           = theme.fg
theme.ibar_bg           = theme.bg

-- Tab label
theme.tab_fg            = theme.fg
theme.tab_bg            = "#d5c4a1"
theme.tab_hover_bg      = "#ebdbb2"
theme.tab_ntheme        = "#7c6f64"
theme.selected_fg       = theme.fg
theme.selected_bg       = theme.bg
theme.selected_ntheme   = "#7c6f64"
theme.loading_fg        = theme.loaded_fg
theme.loading_bg        = theme.loaded_bg

theme.selected_private_tab_bg = "#b16296"
theme.private_tab_bg    = "#d3869b"

-- Trusted/untrusted ssl colours
theme.trust_fg          = "#79740e"
theme.notrust_fg        = "#9d0006"

-- General colour pairings
theme.ok = { fg = theme.fg, bg = theme.bg }
theme.warn = { fg = "#9d0006", bg = theme.bg }
theme.error = { fg = theme.fg, bg = "#cc241d" }

return theme

-- vim: et:sw=4:ts=8:sts=4:tw=80
