
-- Note: Temporaru globals during modularization
-- Standard awesome library
gears = require("gears")
 awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
wibox = require("wibox")
-- Theme handling library
beautiful = require("beautiful")
-- Notification library
naughty = require("naughty")
menubar = require("menubar")
hotkeys_popup = require("awful.hotkeys_popup").widget

local config_path = awful.util.getdir("config") .. "/"
local function load_config_module(name)
   dofile(config_path .. "configuration/" .. name .. ".lua")
end

load_config_module("errors")

freedesktop = require("freedesktop")
load_config_module("variables")

-- {{{ Helper functions
function client_menu_toggle_fn()
    local instance = nil

    return function ()
        if instance and instance.wibox.visible then
            instance:hide()
            instance = nil
        else
            instance = awful.menu.clients({ theme = { width = 250 } })
        end
    end
end
-- }}}

load_config_module("menu")

load_config_module("wibar")

load_config_module("bindings")

load_config_module("rules")

load_config_module("signals")

awful.spawn("compton")
gears.wallpaper.maximized("/home/samis/media/pictures/wallpaper.jpg", nil, true)

