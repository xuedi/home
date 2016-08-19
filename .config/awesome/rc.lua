-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
awful.rules = require("awful.rules")
require("awful.autofocus")

-- Widget and layout library
local wibox = require("wibox")

-- Theme handling library
local beautiful = require("beautiful")

-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")



-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = err })
        in_error = false
    end)
end
-- }}}





-- {{{ Variable definitions
-- Themes define colours, icons, and wallpapers
beautiful.init("~/.config/awesome/themes/zenburn/theme.lua")

-- This is used later as the default terminal and editor to run.
terminal = "terminator"
editor = os.getenv("EDITOR") or "vim"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
local layouts =
{
    awful.layout.suit.tile,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.floating,
    awful.layout.suit.max
}
-- }}}





-- {{{ Wallpaper
if beautiful.wallpaper then
    for s = 1, screen.count() do
        gears.wallpaper.maximized(beautiful.wallpaper, s, true)
    end
end
-- }}}





-- {{{ Tags
-- Define a tag table which hold all screen tags.
tags = {
  names  = { "terminal", "browser", "dev", "text", "folders", "media", "photos", "status", "crypto", "chat", "email", "games", "p2p", "vm"},
  layout = { layouts[1], layouts[4], layouts[4], layouts[1], layouts[1],layouts[1], layouts[1], layouts[1], layouts[1], layouts[1], layouts[1], layouts[4], layouts[4], layouts[4] }
}
for s = 1, screen.count() do
  -- Each screen has its own tag table.
  tags[s] = awful.tag(tags.names, s, tags.layout)
end
-- }}}





-- {{{ Menu
-- Create a laucher widget and a main menu

xmenu = {
  { "Files", "bash /home/xuedi/bin/pcmanfm.sh" },
  { "tools", {
    { "system", {
      { "awesome", {
        { "restart", awesome.restart },
        { "quit", awesome.quit }}
      },
      { "lxappearance", "lxappearance" },
      { "palimpsest", "gnome-disks" },
      { "systemadm", "sudo systemadm" },
      { "status", "terminator -l status" },
      { "LOG-files", "sudo gnome-system-log" },
      { "unetbootin", "unetbootin" }}
    },
    { "gcalctool", "gcalctool" },
    { "fslint", "krc fslint-gui" },
    { "baobab", "baobab" },
    { "S.M.A.R.T", "sudo gsmartcontrol" },
    { "keepass", "keepassx" },
    { "unison", "unison-gtk2" },
    { "gprename", "gprename" },
    { "anki", "python /home/xuedi/projects/other/anki/ankiqt/anki" },
    { "dropbox", "dropbox start" }}
  },
  { "internet", {
    { "tools", {
      { "remmina", "remmina" },
      { "xfreerdp", "xfreerdp" }}
    },
    { "Annon", {
      { "BitMessage", "bash /home/xuedi/bin/pybitmessage.py" },
      { "TorBrowser", "tor-browser-en" }}
    },
    { "firefox", "bash /home/xuedi/bin/firefox.sh" },
    { "geary", "geary" },
    { "claws", "bash /home/xuedi/bin/claws.sh" },
    { "thunderbird", "bash /home/xuedi/bin/thunderbird.sh" },
    { "chrome", "chromium" },
    { "deluge", "deluge" },
    { "pidgin", "pidgin" }}
  },
  { "dev", {
    { "sublime", "subl3" },
    { "phpstorm", "bash /home/xuedi/bin/phpstorm.sh" },
    { "codeblocks", "bash /home/xuedi/bin/codeblocks.sh" }}
  },
  { "dev-tools", {
    { "meld", "meld" },
    { "smartgit", "smartgit" },
    { "qcachegrind", "qcachegrind /home/xuedi/projects/web/tmp/xdebug/callgrind.out" },
    { "umongo", "bash /home/xuedi/projects/other/umongo/launch-umongo.sh" },
    { "sqlitebrowser", "sqlitebrowser" },
    { "Docker-UI", "kitematic" },
    { "mysql-workbench", "mysql-workbench" }}
  },
  { "office", {
    { "gedit", "gedit" },
    { "leafpad", "leafpad" },
    { "lo-writer", "libreoffice --writer --nologo" },
    { "lo-calc", "libreoffice --calc --nologo" },
    { "lo-draw", "libreoffice --draw --nologo" },
    { "lo-impress", "libreoffice --impress --nologo" },
    { "lo-base", "libreoffice --base --nologo" },
    { "lo-math", "libreoffice --base --math" }}
  },
  { "media", {
    { "gogglesmm", "gogglesmm" },
    { "banshee", "banshee" },
    { "gimp", "gimp" },
    { "shotwell", "bash /home/xuedi/bin/shotwell.sh" },
    { "inkscape", "inkscape" },
    { "guvcview", "guvcview" },
    { "handbreake", "ghb" },
    { "mkvtool", "mmg" },
    { "calibre", "calibre" }}
  },
  { "games", {
    { "wurm", "/home/xuedi/bin/wurm.sh" },
    { "steam", "steam" },
    { "desura", "desura" },
    { "minecraft", "minecraft" },
    { "codeweaver", "/opt/cxoffice/bin/cxrun" },
    { "playonlinux", "playonlinux" }}
  },
  { "chinese", {
    { "anki", "anki" }
  }
  },
  { "vm", {
    { "-virtualbox-", "virtualbox" },
    { "FnortVM", "VBoxManage startvm 9f5eed8d-9988-40b1-9395-7f3d30499622" },
    { "Gateway", "VBoxManage startvm a3f4999a-3690-4f13-af9c-1c6fe18361df --type headless" },
    { "UbuntuBox", "VBoxManage startvm 79f15811-1242-4362-82df-c5dab765a090" },
    { "WindowXP", "VBoxManage startvm 040e2ce1-47ec-4e48-b6ec-5ef448bd196d" }}
  },
  { "crypto", {
    { "zenmap", "sudo zenmap" },
    { "gpa (PGP)", "gpa" },
    { "vidalia", "vidalia" },
    { "zmap", "zmap" },
    { "armory (btc)", "armory" },
    { "Seahorse", "seahorse" },
    { "cryptkeeper", "cryptkeeper" }}
  },
  { "::init::", "bash /home/xuedi/bin/start_system.sh" }
}



mymainmenu = awful.menu({ items = xmenu })

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}





-- {{{ Wibox
-- Create a textclock widget
mytextclock = awful.widget.textclock()

-- Create a wibox for each screen and add it
mywibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(awful.tag.getscreen(t)) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(awful.tag.getscreen(t)) end)
                    )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  -- Without this, the following
                                                  -- :isvisible() makes no sense
                                                  c.minimized = false
                                                  if not c:isvisible() then
                                                      awful.tag.viewonly(c:tags()[1])
                                                  end
                                                  -- This will also un-minimize
                                                  -- the client, if needed
                                                  client.focus = c
                                                  c:raise()
                                              end
                                          end),
                     awful.button({ }, 3, function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  instance = awful.menu.clients({ width=250 })
                                              end
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                              if client.focus then client.focus:raise() end
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                              if client.focus then client.focus:raise() end
                                          end))

for s = 1, screen.count() do
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, mytasklist.buttons)

    -- Create the wibox
    mywibox[s] = awful.wibox({ position = "top", screen = s })

    -- Widgets that are aligned to the left
    local left_layout = wibox.layout.fixed.horizontal()
    left_layout:add(mylauncher)
    left_layout:add(mytaglist[s])
    left_layout:add(mypromptbox[s])

    -- Widgets that are aligned to the right
    local right_layout = wibox.layout.fixed.horizontal()
    if s == 1 then right_layout:add(wibox.widget.systray()) end
    right_layout:add(mytextclock)
    right_layout:add(mylayoutbox[s])

    -- Now bring it all together (with the tasklist in the middle)
    local layout = wibox.layout.align.horizontal()
    layout:set_left(left_layout)
    layout:set_middle(mytasklist[s])
    layout:set_right(right_layout)

    mywibox[s]:set_widget(layout)
end
-- }}}





-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}





-- {{{ Key bindings
globalkeys = awful.util.table.join(
    awful.key({ }, "Print", function () awful.util.spawn("scrot '%Y-%m-%d_%I:%M:%S.png' -e 'mv $f ~/downloads/screenshots'") end),
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore),

    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "w", function () mymainmenu:show() end),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.util.spawn(terminal) end),
    awful.key({ modkey, "Control" }, "r", awesome.restart),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)    end),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)    end),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)      end),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)      end),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)         end),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)         end),
    awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1) end),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),

    awful.key({ modkey, "Control" }, "n", awful.client.restore),

    -- Prompt
    awful.key({ modkey },            "r",     function () mypromptbox[mouse.screen]:run() end),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run({ prompt = "Run Lua code: " },
                  mypromptbox[mouse.screen].widget,
                  awful.util.eval, nil,
                  awful.util.getdir("cache") .. "/history_eval")
              end),
    -- Menubar
    awful.key({ modkey }, "p", function() menubar.show() end)
)

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end)
)

-- Compute the maximum number of digit we need, limited to 9
keynumber = 0
for s = 1, screen.count() do
   keynumber = math.min(9, math.max(#tags[s], keynumber))
end

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, keynumber do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        if tags[screen][i] then
                            awful.tag.viewonly(tags[screen][i])
                        end
                  end),
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      if tags[screen][i] then
                          awful.tag.viewtoggle(tags[screen][i])
                      end
                  end),
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.movetotag(tags[client.focus.screen][i])
                      end
                  end),
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.toggletag(tags[client.focus.screen][i])
                      end
                  end))
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}



--get infos via xprob --> WM_CLASS(STRING)

-- {{{ Rules
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     keys = clientkeys,
                     buttons = clientbuttons } },
    { rule = { class = "MPlayer" },     properties = { floating = true } },
    { rule = { class = "Geeqie" }, properties = { border_width = 1, floating = true }  },
    { rule = { class = "Guake" }, properties = { border_width = 1, floating = true }  },
    { rule = { class = "Vlc" }, properties = { border_width = 1, floating = true } },
    { rule = { class = "chromium" }, properties = { floating = false, tag = tags[1][2] } },
    { rule = { class = "net-sourceforge-jnlp-runtime-Boot" }, properties = { floating = true } },
    { rule = { class = "Firefox" }, properties = { tag = tags[1][2] } },
    { rule = { class = "HelloJava - NetBeans IDE 7.2.1" }, properties = { tag = tags[1][3] } },
    { rule = { class = "Subl3" }, properties = { tag = tags[1][3] } },
    { rule = { class = "SmartGit" }, properties = { tag = tags[1][3] } },
    { rule = { class = "Geany" }, properties = { tag = tags[1][3] } },
    { rule = { class = "sublime-text" }, properties = { tag = tags[1][3] } },
    { rule = { class = "Leafpad" }, properties = { tag = tags[1][4] } },
    { rule = { class = "Pcmanfm" }, properties = { tag = tags[1][5], floating = false } },
    { rule = { class = "banshee" }, properties = { tag = tags[1][6] } },
    { rule = { class = "gogglesmm" }, properties = { tag = tags[1][6] } },
    { rule = { class = "Shotwell" }, properties = { tag = tags[1][7] } },
    { rule = { class = "GNU Image Manipulation Program" }, properties = { tag = tags[1][7] } },
    { rule = { class = "Inkscape" }, properties = { tag = tags[1][7] } },
    { rule = { class = "Terminator-status" }, properties = { tag = tags[1][8] } },
    { rule = { class = "Palimpsest" }, properties = { tag = tags[1][8] } },
    { rule = { class = "Zenmap" }, properties = { tag = tags[1][9] } },
    { rule = { class = "Pidgin" }, properties = { tag = tags[1][10] } },
    { rule = { class = "Claws-mail" }, properties = { tag = tags[1][11] } },
    { rule = { class = "Thunderbird" }, properties = { tag = tags[1][11] } },
    { rule = { class = "net-minecraft-LauncherFrame" }, properties = { tag = tags[1][12] } },
    { rule = { class = "com-sun-javaws-Main" }, properties = { tag = tags[1][12] } },
    { rule = { class = "Remmina" }, properties = { tag = tags[1][14] } },
    { rule = { class = "Deluge" }, properties = { tag = tags[1][13] } }
    
}
-- }}}






-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c, startup)
    -- Enable sloppy focus
    c:connect_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end

    local titlebars_enabled = false
    if titlebars_enabled and (c.type == "normal" or c.type == "dialog") then
        -- Widgets that are aligned to the left
        local left_layout = wibox.layout.fixed.horizontal()
        left_layout:add(awful.titlebar.widget.iconwidget(c))

        -- Widgets that are aligned to the right
        local right_layout = wibox.layout.fixed.horizontal()
        right_layout:add(awful.titlebar.widget.floatingbutton(c))
        right_layout:add(awful.titlebar.widget.maximizedbutton(c))
        right_layout:add(awful.titlebar.widget.stickybutton(c))
        right_layout:add(awful.titlebar.widget.ontopbutton(c))
        right_layout:add(awful.titlebar.widget.closebutton(c))

        -- The title goes in the middle
        local title = awful.titlebar.widget.titlewidget(c)
        title:buttons(awful.util.table.join(
                awful.button({ }, 1, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.move(c)
                end),
                awful.button({ }, 3, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.resize(c)
                end)
                ))

        -- Now bring it all together
        local layout = wibox.layout.align.horizontal()
        layout:set_left(left_layout)
        layout:set_right(right_layout)
        layout:set_middle(title)

        awful.titlebar(c):set_widget(layout)
    end
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}

-- xuedi: spacer for conky
--mystatusbar = awful.wibox({ position = "bottom", screen = 1, ontop = false, width = 1, height = 14 })
