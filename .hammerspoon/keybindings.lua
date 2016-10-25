local mod = {}
local hyper = {"ctrl", "alt"}

-- Disable animation when repositioning windows
hs.window.animationDuration = 0

hs.grid.MARGINX = 0
hs.grid.MARGINY = 0
hs.grid.GRIDWIDTH = 10
hs.grid.GRIDHEIGHT = 10

function mod.init()
  -- Move to right half
  hs.hotkey.bind(hyper, "H", function()
    local win = hs.window.focusedWindow()
    hs.grid.set(win, { x = 0, y = 0, w = 5, h = 10 }, win:screen())
  end)

  -- Move window to left half
  hs.hotkey.bind(hyper, "L", function()
    local win = hs.window.focusedWindow()
    hs.grid.set(win, { x = 5, y = 0, w = 5, h = 10 }, win:screen())
  end)

  -- Full screen
  hs.hotkey.bind(hyper, "M", function()
    local win = hs.window.focusedWindow()
    hs.grid.set(win, { x = 0, y = 0, w = 10, h = 10 }, win:screen())
  end)

  -- Move to bottom half
  hs.hotkey.bind(hyper, "J", function()
    local win = hs.window.focusedWindow()
    hs.grid.set(win, { x = 0, y = 5, w = 10, h = 5 }, win:screen())
  end)

  -- Move to top half
  hs.hotkey.bind(hyper, "K", function()
    local win = hs.window.focusedWindow()
    hs.grid.set(win, { x = 0, y = 0, w = 10, h = 5 }, win:screen())
  end)

  -- Application hotkeys
  local charsToApps = {
    n = "Notes",
    p = "1Password 6",
    s = "Safari Technology Preview",
    t = "iTerm"
  }
  for key, app in pairs(charsToApps) do
    hs.hotkey.bind(hyper, key, function()
      hs.application.launchOrFocus(app)
    end)
  end
end

return mod
