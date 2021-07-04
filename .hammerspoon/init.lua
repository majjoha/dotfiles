-- Disable animation when repositioning windows
hs.window.animationDuration = 0

hs.loadSpoon("SpoonInstall")

local hyper = { "ctrl", "alt" }

-- Load all spoons with their respective settings
for plugin, configuration in pairs({
  AppLauncher = {
    hotkeys = {
      c = "Calendar",
      d = "Discord",
      f = "Finder",
      n = "Notes",
      p = "1Password 7",
      r = "Reeder",
      s = "Safari Technology Preview",
      t = "Kitty",
      z = "Zoom.us",
    },
  },
  Caffeine = {
    fn = function(caffeine)
      caffeine:start():setState(true)
    end,
  },
  FnMate = {},
  ReloadConfiguration = { start = true },
  WindowHalfsAndThirds = {
    hotkeys = {
      left_half = { hyper, "H" },
      right_half = { hyper, "L" },
      bottom_half = { hyper, "J" },
      top_half = { hyper, "K" },
      top_right = { hyper, "]" },
      bottom_right = { hyper, "'" },
      top_left = { hyper, "[" },
      bottom_left = { hyper, ";" },
      max_toggle = { hyper, "M" },
      smaller = { hyper, "," },
      larger = { hyper, "." },
      center = { hyper, "/" },
    },
  },
}) do
  spoon.SpoonInstall:andUse(plugin, configuration)
end

hs.alert.show("Config loaded")
