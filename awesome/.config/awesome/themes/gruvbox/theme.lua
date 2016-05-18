-------------------------------
--  "gruvbox" awesome theme  --
--      By McSinyx (cnx)     --
-------------------------------

-- Alternative icon sets and widget icons:
--  * http://awesome.naquadah.org/wiki/Nice_Icons

-- {{{ Main
theme = {}
--theme.wallpaper = mythemedir .. "gradient-debian-big.png"
theme.wallpaper_cmd = { "hsetroot -solid '#282828'" }
-- }}}

-- {{{ Styles
theme.font  = "Droid Sans Mono Slashed 11"
mybg        = "#282828"
mybg_alt    = "#3c3836"
myfg        = "#ebdbb2"
myred       = "#cc241d"
mypurple    = "#b16286"

-- {{{ Colors
theme.fg_normal  = myfg
theme.fg_focus   = myfg
theme.fg_urgent  = "#d3869b"
theme.bg_normal  = mybg
theme.bg_focus   = mybg_alt
theme.bg_urgent  = theme.bg_normal
theme.bg_systray = theme.bg_normal
-- }}}

-- {{{ Borders
theme.border_width  = 1
theme.border_normal = "#3c3836"
theme.border_focus  = "#b16286"
theme.border_marked = "#d3869b"
-- }}}

-- {{{ Titlebars
theme.titlebar_bg_focus  = "#282828"
theme.titlebar_bg_normal = "#282828"
-- }}}

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- Example:
--theme.taglist_bg_focus = "#d3869b"
-- }}}

-- {{{ Widgets
-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.fg_widget        = "#AECF96"
--theme.fg_center_widget = "#88A175"
--theme.fg_end_widget    = "#FF5656"
--theme.bg_widget        = "#494B4F"
--theme.border_widget    = "#282828"
-- }}}

-- {{{ Mouse finder
theme.mouse_finder_color = "#d3869b"
-- mouse_finder_[timeout|animate_timeout|radius|factor]
-- }}}

-- {{{ Menu
-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_height = 20
theme.menu_width  = 160
-- }}}

-- {{{ Icons
mythemedir = "~/.config/awesome/themes/gruvbox/"
-- {{{ Taglist
theme.taglist_squares_sel   = mythemedir .. "taglist/squarefz.png"
theme.taglist_squares_unsel = mythemedir .. "taglist/squarez.png"
--theme.taglist_squares_resize = "false"
-- }}}

-- {{{ Misc
theme.awesome_icon           = mythemedir .. "awesome-icon.png"
theme.menu_submenu_icon      = mythemedir .. "submenu.png"
-- }}}

-- {{{ Layout
theme.layout_tile       = mythemedir .. "layouts/tile.png"
theme.layout_tileleft   = mythemedir .. "layouts/tileleft.png"
theme.layout_tilebottom = mythemedir .. "layouts/tilebottom.png"
theme.layout_tiletop    = mythemedir .. "layouts/tiletop.png"
theme.layout_fairv      = mythemedir .. "layouts/fairv.png"
theme.layout_fairh      = mythemedir .. "layouts/fairh.png"
theme.layout_spiral     = mythemedir .. "layouts/spiral.png"
theme.layout_dwindle    = mythemedir .. "layouts/dwindle.png"
theme.layout_max        = mythemedir .. "layouts/max.png"
theme.layout_fullscreen = mythemedir .. "layouts/fullscreen.png"
theme.layout_magnifier  = mythemedir .. "layouts/magnifier.png"
theme.layout_floating   = mythemedir .. "layouts/floating.png"

-- Lain's useless layouts
theme.layout_uselesstile        = theme.layout_tile
theme.layout_uselesstileleft    = theme.layout_tileleft
theme.layout_uselesstilebottom  = theme.layout_tilebottom
theme.layout_uselesstiletop     = theme.layout_tiletop
theme.layout_uselessfair        = theme.layout_fairv
theme.layout_uselessfairh       = theme.layout_fairh
theme.layout_uselesspiral       = theme.layout_spiral
theme.layout_uselessdwindle     = theme.layout_dwindle
theme.useless_gap_width = 12
-- }}}

-- {{{ Titlebar
theme.titlebar_close_button_focus  = mythemedir .. "titlebar/close_focus.png"
theme.titlebar_close_button_normal = mythemedir .. "titlebar/normal.png"

theme.titlebar_ontop_button_focus_active  = mythemedir .. "titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = mythemedir .. "titlebar/normal.png"
theme.titlebar_ontop_button_focus_inactive  = mythemedir .. "titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = mythemedir .. "titlebar/normal.png"

theme.titlebar_sticky_button_focus_active  = mythemedir .. "titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active = mythemedir .. "titlebar/normal.png"
theme.titlebar_sticky_button_focus_inactive  = mythemedir .. "titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = mythemedir .. "titlebar/normal.png"

theme.titlebar_floating_button_focus_active  = mythemedir .. "titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active = mythemedir .. "titlebar/normal.png"
theme.titlebar_floating_button_focus_inactive  = mythemedir .. "titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = mythemedir .. "titlebar/normal.png"

theme.titlebar_maximized_button_focus_active  = mythemedir .. "titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = mythemedir .. "titlebar/normal.png"
theme.titlebar_maximized_button_focus_inactive  = mythemedir .. "titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = mythemedir .. "titlebar/normal.png"
-- }}}

-- {{{ Arrows
theme.arrow0 = mythemedir .. "arrows/0.png"
theme.arrow1 = mythemedir .. "arrows/1.png"
theme.arrow2 = mythemedir .. "arrows/2.png"
theme.arrow3 = mythemedir .. "arrows/3.png"
theme.arrow4 = mythemedir .. "arrows/4.png"
theme.arrow5 = mythemedir .. "arrows/5.png"
-- }}}
-- }}}

return theme
