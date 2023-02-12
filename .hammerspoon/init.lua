-- Disable animation when repositioning windows
hs.window.animationDuration = 0

hs.loadSpoon("SpoonInstall")

local hyper = { "ctrl", "alt" }

hs.hints.style = "vimperator"
hs.hints.fontName = "SFPro-Regular"
hs.hints.fontSize = 20
hs.hints.windowHints(hs.window.focusedWindow():application():allWindows())
hs.hotkey.bind(hyper, "Space", hs.hints.windowHints)

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
    },
  },
  Caffeine = {
    fn = function(caffeine)
      caffeine:start():setState(true)
    end,
  },
  Cherry = {},
  FnMate = {},
  KSheet = { hotkeys = { toggle = { { "ctrl", "alt", "shift" }, "/" } } },
  ReloadConfiguration = { start = true }
}) do
  spoon.SpoonInstall:andUse(plugin, configuration)
end

hs.alert.show("Config loaded")
