local hyper = require "hyper"
local mod = {}

function mod.init()
  -- Scroll up
  hs.hotkey.bind(hyper, ".", function()
    hs.eventtap.scrollWheel({0, 50}, {}, "pixel")
  end, nil, function()
    hs.eventtap.scrollWheel({0, 50}, {}, "pixel")
  end)

  -- Scroll down
  hs.hotkey.bind(hyper, ",", function()
    hs.eventtap.scrollWheel({0, -50}, {}, "pixel")
  end, nil, function()
    hs.eventtap.scrollWheel({0, -50}, {}, "pixel")
  end)

  -- Application hotkeys
  local apps = {
    c = "Calendar",
    d = "Discord",
    f = "Firefox Developer Edition",
    n = "Notes",
    p = "1Password 7",
    r = "Reeder",
    t = "Kitty",
    z = "Zoom.us"
  }

  for key, app in pairs(apps) do
    hs.hotkey.bind(hyper, key, function()
      hs.application.launchOrFocus(app)
    end)
  end
end

return mod
