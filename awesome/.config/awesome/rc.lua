-- Localize Lua standard library
local io = {popen = io.popen}
-- Standard awesome library
local gears = require"gears"
local awful = require"awful"
require"awful.autofocus"
-- Widget and layout library
local wibox = require"wibox"
-- Menu library
local freedesktop = require"freedesktop"
-- Theme handling library
local beautiful = require"beautiful"
-- Notification library
local naughty = require"naughty"
local menubar = require"menubar"
local hotkeys_popup = require"awful.hotkeys_popup".widget
-- System data library
local vicious = require"vicious"

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
  naughty.notify{preset = naughty.config.presets.critical,
                 title = "Oops, there were errors during startup!",
                 text = awesome.startup_errors}
end

-- Handle runtime errors after startup
do
  local in_error = false
  awesome.connect_signal("debug::error", function (err)
    -- Make sure we don't go into an endless error loop
    if in_error then return end
    in_error = true

    naughty.notify{preset = naughty.config.presets.critical,
                   title = "Oops, an error happened!",
                   text = tostring(err)}
    in_error = false
  end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init"~/.config/awesome/themes/srcery/theme.lua"

-- This is used later as the default terminal and editor to run.
local terminal = "x-terminal-emulator"
local editor = "gvim"
-- And some additional applications
local root_terminal = "x-terminal-emulator -e su -"
local pulsemixer = "x-terminal-emulator -e pulsemixer"
local ranger = "x-terminal-emulator -e ranger"
local python3 = "x-terminal-emulator -e python3"
local perl6 = "x-terminal-emulator -e perl6"
local guile = "x-terminal-emulator -e guile"
local slock_suspend = "slock systemctl --ignore-inhibitors suspend"

-- Audacious media player
local audacious_main_window = "audacious --show-main-window"
local audacious_jump_box = "audacious --show-jump-box"
local audacious_play_pause = "audacious --play-pause"
local audacious_rewind = "audacious --rew"
local audacious_forward = "audacious --fwd"

local scrot = "scrot /home/cnx/Desktop/%FT%T.png"
local scrot_select = "scrot --select /home/cnx/Desktop/%FT%T.png"

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with
-- others.
local modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
  awful.layout.suit.fair,
  --awful.layout.suit.fair.horizontal,
  awful.layout.suit.tile,
  --awful.layout.suit.tile.left,
  --awful.layout.suit.tile.bottom,
  --awful.layout.suit.tile.top,
  --awful.layout.suit.spiral,
  --awful.layout.suit.spiral.dwindle,
  awful.layout.suit.max,
  awful.layout.suit.max.fullscreen,
  --awful.layout.suit.magnifier,
  --awful.layout.suit.corner.nw,
  --awful.layout.suit.corner.ne,
  --awful.layout.suit.corner.sw,
  --awful.layout.suit.corner.se
  awful.layout.suit.floating,
}
-- }}}

-- {{{ Helper functions
local function client_menu_toggle_fn()
  local instance = nil

  return function ()
    if instance and instance.wibox.visible then
      instance:hide()
      instance = nil
    else
      instance = awful.menu.clients{theme = {width = 250}}
    end
  end
end

local function spawner(command)
  return function () awful.spawn(command) end
end

local function update_widget(command, widget)
  awful.spawn.easy_async(command, function () vicious.force{widget} end)
end
-- }}}

-- {{{ Menu
-- Create a launcher widget and a main menu
local myawesomemenu = {
  {"hotkeys", function () return false, hotkeys_popup.show_help end},
  {"manual", terminal .. " -e man awesome"},
  {"edit config", editor .. " " .. awesome.conffile},
  {"restart", awesome.restart},
  {"quit", function () awesome.quit() end}
}

local mymainmenu = freedesktop.menu.build{
  before = {{"Awesome", myawesomemenu, beautiful.awesome_icon}},
  after = {{"Open terminal", terminal}}
}

-- mylauncher = awful.widget.launcher{image = beautiful.awesome_icon,
--                                    menu = mymainmenu}

-- Menubar configuration
-- Set geometry so it would overlay the wibox
menubar.geometry = {y = 0, height = 22}
-- Set the terminal for applications that require it
menubar.utils.terminal = terminal
-- }}}

-- Keyboard map indicator and switcher
-- mykeyboardlayout = awful.widget.keyboardlayout()

-- {{{ Wibar
-- Create a textclock widget
local mytextclock = wibox.widget.textclock" #%u %FT%R"

-- Create a CPU usage widget
local mycpuusage = wibox.widget.textbox()
vicious.register(mycpuusage, vicious.widgets.cpu,
                 function (widget, args)
                   return (" CPU%03d%%"):format(args[1])
                 end, 3)

-- Create memory usage widgets
local mymemusage = wibox.widget.textbox()
vicious.register(mymemusage, vicious.widgets.mem,
                 function (widget, args)
                   return (" MEM%03d%%"):format(args[1])
                 end, 2)
                 --
-- Create a battery widget
local mybattery_text = wibox.widget.textbox()
vicious.register(mybattery_text, vicious.widgets.bat,
                 function (widget, args)
                   return (" %s%03d%%"):format(args[1], args[2])
                 end, 7, "BAT0")
local mybattery = wibox.container.background(mybattery_text, beautiful.green)
mybattery.fg = beautiful.gray
mybattery:buttons(awful.util.table.join(
  awful.button({}, 1, spawner"mate-power-statistics"),
  awful.button({}, 3, spawner"mate-power-preferences")
))

-- Create a volume widget
local myvolume_text = wibox.widget.textbox()
vicious.register(myvolume_text,
                 {async = function (format, warg, callback)
                    awful.spawn.easy_async(
                      "pulsemixer --get-volume --get-mute",
                      function (stdout)
                        local volume = {}
                        for m in stdout:gmatch"(%d+)" do
                          table.insert(volume, tonumber(m))
                        end
                        callback(volume)
                      end)
                  end},
                 function (widget, args)
                   return (" %s%03d%%"):format(
                     args[3] == 0 and '🔉' or '🔈',
                     math.floor((args[1] + args[2] + 1) / 2))
                 end, 1)

local function volume_setter(parameter)
  return function ()
           if type(parameter) ~= "string" then return end
           update_widget("pulsemixer --change-volume " .. parameter,
                         myvolume_text)
         end
end
local function volume_mute(parameter)
  update_widget("pulsemixer --toggle-mute", myvolume_text)
end

local myvolume = wibox.container.background(myvolume_text, beautiful.cyan)
myvolume.fg = beautiful.gray
myvolume:buttons(awful.util.table.join(
  awful.button({}, 1, volume_setter"-5"),
  awful.button({}, 2, volume_mute),
  awful.button({}, 3, volume_setter"+5"),
  awful.button({}, 4, volume_setter"+1"),
  awful.button({}, 5, volume_setter"-1")
))

-- Create a widget for music player
local myplayer_text = wibox.widget.textbox()
awful.spawn.with_line_callback(
  "playerctl --follow metadata --format ' {{artist}} <{{status}}> {{title}}'",
  {stdout = function (line)
     myplayer_text:set_text(line:gsub('<Playing>', '>'):gsub('<.+>', '|'))
   end}
)

local function audacious_seeker(time)
  return function ()
    awful.spawn(("audtool playback-seek-relative %f"):format(time))
  end
end

local myplayer = wibox.container.background(myplayer_text, beautiful.magenta)
myplayer.fg = beautiful.gray
myplayer:buttons(awful.util.table.join(
  awful.button({}, 1, spawner(audacious_rewind)),
  awful.button({}, 2, spawner(audacious_play_pause)),
  awful.button({}, 3, spawner(audacious_forward)),
  awful.button({}, 4, audacious_seeker(1)),
  awful.button({}, 5, audacious_seeker(-1))
))

-- Create a weather widget
local myweather = wibox.widget.textbox()
vicious.register(myweather, vicious.widgets.weather,
                 function (widget, args)
                   if args["{tempf}"] ~= "N/A" then
                     return (" %s°C %s%%"):format(args["{tempc}"],
                                                  args["{humid}"])
                   else
                     return ""
                   end
                 end, 61, "VVNB")

-- Create a wibox for each screen and add it
local taglist_buttons = awful.util.table.join(
  awful.button({}, 1, function (t) t:view_only() end),
  awful.button({modkey}, 1, function (t)
    if client.focus then client.focus:move_to_tag(t) end
  end),
  awful.button({}, 3, awful.tag.viewtoggle),
  awful.button({modkey}, 3, function (t)
    if client.focus then client.focus:toggle_tag(t) end
  end),
  awful.button({}, 4, function (t) awful.tag.viewnext(t.screen) end),
  awful.button({}, 5, function (t) awful.tag.viewprev(t.screen) end)
)

local tasklist_buttons = awful.util.table.join(
  awful.button({}, 1, function (c)
    if c == client.focus then
      c.minimized = true
    else
      -- Without this, the following
      -- :isvisible() makes no sense
      c.minimized = false
      if not c:isvisible() and c.first_tag then c.first_tag:view_only() end
      -- This will also un-minimize
      -- the client, if needed
      client.focus = c
      c:raise()
    end
  end),
  awful.button({}, 3, client_menu_toggle_fn()),
  awful.button({}, 4, function () awful.client.focus.byidx(1) end),
  awful.button({}, 5, function () awful.client.focus.byidx(-1) end)
)

local function set_wallpaper(s)
  -- Wallpaper
  if beautiful.wallpaper then
    local wallpaper = beautiful.wallpaper
    -- If wallpaper is a function, call it with the screen
    if type(wallpaper) == "function" then
      wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)
  end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function (s)
  set_wallpaper(s)
  -- Each screen has its own tag table.
  awful.tag({"1", "2", "3", "4", "5", "6", "7", "8", "9"}, s,
            awful.layout.layouts[1])

  -- Create a promptbox for each screen
  s.mypromptbox = awful.widget.prompt{prompt = " "}
  -- Create an imagebox widget which will contains an icon indicating which
  -- layout we're using.
  -- We need one layoutbox per screen.
  s.mylayoutbox = awful.widget.layoutbox(s)
  s.mylayoutbox:buttons(awful.util.table.join(
    awful.button({}, 1, function () awful.layout.inc(1) end),
    awful.button({}, 3, function () awful.layout.inc(-1) end),
    awful.button({}, 4, function () awful.layout.inc(1) end),
    awful.button({}, 5, function () awful.layout.inc(-1) end)
  ))
  -- Create a taglist widget
  s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all,
                                     taglist_buttons)

  -- Create a tasklist widget
  -- s.mytasklist = awful.widget.tasklist(
  --   s,
  --   awful.widget.tasklist.filter.currenttags,
  --   tasklist_buttons
  -- )

  -- Create the wibox
  s.mywibox = awful.wibar{position = "top", height = "22", screen = s}

  -- Add widgets to the wibox
  s.mywibox:setup{
    layout = wibox.layout.align.horizontal,
    {-- Left widgets
     layout = wibox.layout.fixed.horizontal,
     -- mylauncher,
     {mytextclock,
      bg = beautiful.red,
      fg = beautiful.gray,
      widget = wibox.container.background},
     wibox.widget.imagebox(beautiful.arrow0),
     {mycpuusage,
      bg = beautiful.orange,
      fg = beautiful.gray,
      widget = wibox.container.background},
     wibox.widget.imagebox(beautiful.arrow1),
     {mymemusage,
      bg = beautiful.yellow,
      fg = beautiful.gray,
      widget = wibox.container.background},
     wibox.widget.imagebox(beautiful.arrow2),
     mybattery,
     wibox.widget.imagebox(beautiful.arrow3),
     myvolume,
     wibox.widget.imagebox(beautiful.arrow4),
     {myweather,
      bg = beautiful.blue,
      fg = beautiful.gray,
      widget = wibox.container.background},
     wibox.widget.imagebox(beautiful.arrow5),
     myplayer,
     wibox.widget.imagebox(beautiful.arrow6),
     s.mypromptbox
    },
    {-- Middle widget
     layout = wibox.layout.fixed.horizontal,
    },
    -- s.mytasklist,
    { -- Right widgets
      layout = wibox.layout.fixed.horizontal,
      -- mykeyboardlayout,
      wibox.widget.systray(),
      s.mytaglist,
      s.mylayoutbox
    }
  }
end)
-- }}}

-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
  awful.button({}, 3, function () mymainmenu:toggle() end),
  awful.button({}, 4, awful.tag.viewnext),
  awful.button({}, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Prompt for Lua code
local function lua_prompt()
  local textbox = awful.screen.focused().mypromptbox.widget
  awful.prompt.run{prompt = " ", text = "return ",
                   exe_callback = function (s)
                     -- In case awful.util.eval returns nothing, result is nil
                     result = awful.util.eval(s)
                     textbox:set_text(" " .. tostring(result))
                   end,
                   history_path = awful.util.get_cache_dir() .. "/lua_history",
                   textbox = textbox}
end
-- }}}

-- {{{ Key bindings
local globalkeys = awful.util.table.join(
  awful.key({modkey, "Control"}, "x", lua_prompt,
            {description = "execute prompt", group = "awesome"}),
  awful.key({modkey, "Control"}, "s", hotkeys_popup.show_help,
            {description="show help", group="awesome"}),
  awful.key({modkey}, "Left", awful.tag.viewprev,
            {description = "view previous", group = "tag"}),
  awful.key({modkey}, "Right", awful.tag.viewnext,
            {description = "view next", group = "tag"}),
  awful.key({modkey}, "Escape", awful.tag.history.restore,
            {description = "go back", group = "tag"}),

  awful.key({modkey}, "j", function () awful.client.focus.byidx(1) end,
            {description = "focus next by index", group = "client"}),
  awful.key({modkey}, "k", function () awful.client.focus.byidx(-1) end,
            {description = "focus previous by index", group = "client"}),
  awful.key({modkey}, "w", function () mymainmenu:show() end,
            {description = "show main menu", group = "awesome"}),

  -- Layout manipulation
  awful.key({modkey, "Shift"}, "j", function () awful.client.swap.byidx(1) end,
            {description = "swap with next client by index", group = "client"}),
  awful.key({modkey, "Shift"}, "k", function () awful.client.swap.byidx(-1)end,
            {description = "swap with previous client by index",
             group = "client"}),
  awful.key({modkey}, "0",
            function () awful.screen.focus_relative(1) end,
            {description = "focus the next screen", group = "screen"}),
  awful.key({modkey}, "`",
            function () awful.screen.focus_relative(-1) end,
            {description = "focus the previous screen", group = "screen"}),
  awful.key({modkey}, "u", awful.client.urgent.jumpto,
            {description = "jump to urgent client", group = "client"}),
  awful.key({modkey}, "Tab",
            function ()
              awful.client.focus.history.previous()
              if client.focus then client.focus:raise() end
            end,
            {description = "go back", group = "client"}),

  -- Standard program
  awful.key({modkey}, "x", spawner(terminal),
            {description = "open a terminal", group = "launcher"}),
  awful.key({modkey, "Shift"}, "x", spawner(root_terminal),
            {description = "open a root terminal", group = "launcher"}),
  awful.key({modkey}, "v", spawner(editor),
            {description = "open GVim", group = "launcher"}),
  awful.key({modkey}, "e", spawner"emacsclient -c",
            {description = "open Emacs", group = "launcher"}),
  awful.key({modkey}, "b", spawner"qutebrowser",
            {description = "open qutebrowser", group = "launcher"}),
  awful.key({modkey, "Shift"}, "b", spawner"torify luakit --nounique",
            {description = "open torified Luakit", group = "launcher"}),
  awful.key({modkey}, "f", spawner"firefox",
            {description = "open Firefox", group = "launcher"}),
  awful.key({modkey, "Shift"}, "f", spawner"torbrowser-launcher",
            {description = "open Tor Browser", group = "launcher"}),
  awful.key({modkey}, "t", spawner"thunderbird",
            {description = "open Thunderbird", group = "launcher"}),
  awful.key({modkey, "Shift"}, "g", spawner"gimp",
            {description = "open GIMP", group = "launcher"}),
  awful.key({modkey, "Shift"}, "m", spawner"moodledesktop",
            {description = "open Moodle Desktop", group = "launcher"}),
  awful.key({modkey}, "r", spawner(ranger),
            {description = "open ranger file manager", group = "launcher"}),
  awful.key({modkey}, "p", spawner(python3),
            {description = "open Python 3 interpreter", group = "launcher"}),
  awful.key({modkey, "Shift"}, "p", spawner(perl6),
            {description = "open Perl 6", group = "launcher"}),
  awful.key({modkey}, "g", spawner(guile),
            {description = "open Guile interpreter", group = "launcher"}),
  awful.key({modkey}, "o", spawner"geogebra-classic",
            {description = "open GeoGebra", group = "launcher"}),
  awful.key({modkey}, "z", spawner"zathura",
            {description = "open zathura document viewer", group = "launcher"}),
  awful.key({modkey}, "d", spawner"diodon",
            {description = "open clipboard manager", group = "launcher"}),
  awful.key({modkey}, "s", spawner"slock",
            {description = "lock screen", group = "launcher"}),
  awful.key({modkey, "Shift"}, "s", spawner(slock_suspend),
            {description = "lock screen then suspend", group = "launcher"}),
  awful.key({modkey}, "m", spawner(pulsemixer),
            {description = "open PulseAudio mixer", group = "multimedia"}),
  awful.key({modkey}, "a", spawner(audacious_jump_box),
            {description = "Audacious: jump-to-song", group = "multimedia"}),
  awful.key({modkey, "Shift"}, "a", spawner(audacious_main_window),
            {description = "Audacious: main window", group = "launcher"}),
  awful.key({modkey, "Control"}, "a", spawner(audacious_play_pause),
            {description = "Audacious: play/pause", group = "multimedia"}),
  awful.key({modkey}, "Up", spawner(audacious_rewind),
            {description = "Audacious: previous track", group = "multimedia"}),
  awful.key({modkey}, "Down", spawner(audacious_forward),
            {description = "Audacious: next track", group = "multimedia"}),
  awful.key({}, "XF86AudioPlay", spawner(audacious_play_pause),
            {description = "Audacious: jump-to-song", group = "multimedia"}),
  awful.key({}, "XF86AudioPrev", spawner(audacious_rewind),
            {description = "Audacious: previous track", group = "multimedia"}),
  awful.key({}, "XF86AudioNext", spawner(audacious_forward),
            {description = "Audacious: next track", group = "multimedia"}),
  awful.key({}, "XF86Display", spawner"arandr",
            {description = "open Arandr", group = "multimedia"}),
  awful.key({}, "Print", nil, spawner(scrot_select),
            {description = "shoot a window or rectangle selected with a mouse",
             group = "multimedia"}),
  awful.key({"Shift"}, "Print", spawner(scrot),
            {description = "capture a screenshot", group = "multimedia"}),
  awful.key({}, "XF86AudioRaiseVolume", volume_setter"+5",
            {description = "raise 5% volume", group = "multimedia"}),
  awful.key({}, "XF86AudioLowerVolume", volume_setter"-5",
            {description = "lower 5% volume", group = "multimedia"}),
  awful.key({}, "XF86AudioMute", volume_mute,
            {description = "(un)mute volume", group = "multimedia"}),

  awful.key({modkey, "Control"}, "r", awesome.restart,
            {description = "reload awesome", group = "awesome"}),
  awful.key({modkey, "Shift"}, "q", awesome.quit,
            {description = "quit awesome", group = "awesome"}),

  awful.key({modkey}, "l", function () awful.tag.incmwfact(0.05) end,
            {description = "increase master width factor", group = "layout"}),
  awful.key({modkey}, "h", function () awful.tag.incmwfact(-0.05) end,
            {description = "decrease master width factor", group = "layout"}),
  awful.key({modkey, "Shift"}, "h",
            function () awful.tag.incnmaster(1, nil, true) end,
            {description = "increase the number of master clients",
             group = "layout"}),
  awful.key({modkey, "Shift"}, "l",
            function () awful.tag.incnmaster(-1, nil, true) end,
            {description = "decrease the number of master clients",
             group = "layout"}),
  awful.key({modkey, "Control"}, "h",
            function () awful.tag.incncol(1, nil, true) end,
            {description = "increase the number of columns", group = "layout"}),
  awful.key({modkey, "Control"}, "l",
            function () awful.tag.incncol(-1, nil, true) end,
            {description = "decrease the number of columns", group = "layout"}),
  awful.key({modkey}, "Return", function () awful.layout.inc(1) end,
            {description = "select next", group = "layout"}),
  awful.key({modkey, "Shift"}, "Return", function () awful.layout.inc(-1) end,
            {description = "select previous", group = "layout"}),

  awful.key({modkey, "Control"}, "n",
            function ()
              local c = awful.client.restore()
              -- Focus restored client
              if c then
                client.focus = c
                c:raise()
              end
            end,
            {description = "restore minimized", group = "client"}),

  -- Prompt
  awful.key({modkey}, ";",
            function () awful.screen.focused().mypromptbox:run() end,
            {description = "run prompt", group = "launcher"}),
  -- Menubar
  awful.key({modkey, "Shift"}, ";", menubar.show,
            {description = "show the menubar", group = "launcher"})
)

local clientkeys = awful.util.table.join(
  awful.key({modkey, "Control"}, "f",
            function (c)
              --awful.titlebar.show(c)
              c.fullscreen = not c.fullscreen
              c:raise()
            end,
            {description = "toggle fullscreen", group = "client"}),
  awful.key({modkey}, "q", function (c) c:kill() end,
            {description = "close", group = "client"}),
  awful.key({modkey, "Control"}, "q", spawner"xkill",
            {description = "select a window to be killed", group = "client"}),
  awful.key({modkey, "Control"}, "Return", awful.client.floating.toggle,
            {description = "toggle floating", group = "client"}),
  awful.key({modkey, "Control"}, "space",
            function (c) c:swap(awful.client.getmaster()) end,
            {description = "move to master", group = "client"}),
  awful.key({modkey, "Shift"}, "0", function (c) c:move_to_screen() end,
            {description = "move to screen", group = "client"}),
  awful.key({modkey, "Shift"}, "`", function (c) c:move_to_screen() end,
            {description = "move to screen", group = "client"}),
  awful.key({modkey}, "t", function (c) c.ontop = not c.ontop end,
            {description = "toggle keep on top", group = "client"}),
  awful.key({modkey}, "n",
            function (c)
              -- The client currently has the input focus, so it cannot be
              -- minimized, since minimized clients can't have the focus.
              c.minimized = true
            end,
            {description = "minimize", group = "client"}),
  awful.key({modkey, "Control"}, "m",
            function (c)
              c.maximized = not c.maximized
              c:raise()
            end,
            {description = "maximize", group = "client"})
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = awful.util.table.join(
      globalkeys,
      -- View tag only.
      awful.key({modkey}, "#" .. i + 9,
                function ()
                  local screen = awful.screen.focused()
                  local tag = screen.tags[i]
                  if tag then tag:view_only() end
                end,
                {description = "view tag #"..i, group = "tag"}),
      -- Toggle tag display.
      awful.key({modkey, "Control"}, "#" .. i + 9,
                function ()
                  local screen = awful.screen.focused()
                  local tag = screen.tags[i]
                  if tag then awful.tag.viewtoggle(tag) end
                end,
                {description = "toggle tag #" .. i, group = "tag"}),
      -- Move client to tag.
      awful.key({modkey, "Shift"}, "#" .. i + 9,
                function ()
                  if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then client.focus:move_to_tag(tag) end
                  end
                end,
                {description = "move focused client to tag #"..i,
                 group = "tag"}),
      -- Toggle tag on focused client.
      awful.key({modkey, "Control", "Shift"}, "#" .. i + 9,
                function ()
                  if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then client.focus:toggle_tag(tag) end
                  end
                end,
                {description = "toggle focused client on tag #" .. i,
                 group = "tag"})
    )
end

local clientbuttons = awful.util.table.join(
  awful.button({}, 1, function (c) client.focus = c; c:raise() end),
  awful.button({modkey}, 1, awful.mouse.client.move),
  awful.button({modkey}, 3, awful.mouse.client.resize)
)

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
  -- All clients will match this rule.
  {rule = {},
   properties = {
     border_width = beautiful.border_width,
     border_color = beautiful.border_normal,
     focus = awful.client.focus.filter,
     raise = true,
     keys = clientkeys,
     buttons = clientbuttons,
     screen = awful.screen.preferred,
     placement = awful.placement.no_overlap + awful.placement.no_offscreen,
     size_hints_honor = false
   }},

  -- Floating clients.
  {rule_any = {
    instance = {
      "DTA",  -- Firefox addon DownThemAll.
      "copyq",  -- Includes session name in class.
    },
    class = {
      "Arandr",
      "Gpick",
      "Gcolor2",
      "Kruler",
      "MessageWin",  -- kalarm.
      "Sxiv",
      "Torbrowser-launcher",
      "Twf",
      "Wpa_gui",
      "ac_client",
      "pinentry",
      "veromix",
      "xtightvncviewer"
    },
    name = {
      "Event Tester"  -- xev.
    },
    role = {
      "AlarmWindow",  -- Thunderbird's calendar.
      "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
    },
   }, properties = {floating = true}},

  -- Add titlebars to normal clients and dialogs
  {rule_any = {type = {"normal", "dialog"}},
   properties = {titlebars_enabled = true}}

  -- Set Firefox to always map on the tag named "2" on screen 1.
  -- {rule = {class = "Firefox"},
  --   properties = {screen = 1, tag = "2"}}
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal(
  "manage",
  function (c)
  -- Set the windows at the slave,
  -- i.e. put it at the end of others instead of setting it master.
  -- if not awesome.startup then awful.client.setslave(c) end
    if awesome.startup and
       not c.size_hints.user_position and
       not c.size_hints.program_position then
      -- Prevent clients from being unreachable after screen count changes.
      awful.placement.no_offscreen(c)
    end
  end
)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal(
  "request::titlebars",
  function (c)
    -- buttons for the titlebar
    local buttons = awful.util.table.join(
      awful.button({}, 1,
                   function ()
                     client.focus = c
                     c:raise()
                     awful.mouse.client.move(c)
                   end),
      awful.button({}, 3,
                   function ()
                     client.focus = c
                     c:raise()
                     awful.mouse.client.resize(c)
                   end)
    )

    awful.titlebar(c, {size=22}):setup{
      {-- Left
       awful.titlebar.widget.closebutton(c),
       awful.titlebar.widget.ontopbutton(c),
       awful.titlebar.widget.stickybutton(c),
       awful.titlebar.widget.maximizedbutton(c),
       awful.titlebar.widget.floatingbutton(c),
       layout  = wibox.layout.fixed.horizontal
      },
      {-- Middle
       {-- Title
        align  = "center",
        widget = awful.titlebar.widget.titlewidget(c)
       },
       buttons = buttons,
       layout  = wibox.layout.flex.horizontal
      },
      { -- Right
        awful.titlebar.widget.iconwidget(c),
        buttons = buttons,
        layout = wibox.layout.fixed.horizontal
      },
      layout = wibox.layout.align.horizontal
    }

    -- Show titlebar if client is floating, hide otherwise.
    --if not c.floating and
    --   awful.layout.get(c.screen) ~= awful.layout.suit.floating then
    --  awful.titlebar.hide(c)
    --end
  end
)

-- Show titlebar if client is floating, hide otherwise.
--client.connect_signal(
--  "property::floating",
--  function (c)
--    if c.floating or
--       awful.layout.get(c.screen) == awful.layout.suit.floating then
--      awful.titlebar.show(c)
--    else
--      awful.titlebar.hide(c)
--    end
--  end
--)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal(
  "mouse::enter",
  function (c)
    if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier and
       awful.client.focus.filter(c) then
      client.focus = c
    end
  end
)

client.connect_signal("focus",
                      function (c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus",
                      function (c) c.border_color = beautiful.border_normal end)

-- Show titlebar if client is floating, hide otherwise.
--tag.connect_signal(
--  "property::layout",
--  function (t)
--    if t.layout == awful.layout.suit.floating then
--      for _, c in pairs(t:clients()) do awful.titlebar.show(c) end
--    else
--      for _, c in pairs(t:clients()) do
--        if not c.floating then awful.titlebar.hide(c) end
--      end
--    end
--  end
--)
-- }}}
