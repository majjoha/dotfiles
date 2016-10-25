local caffeine = hs.menubar.new()
local mod = {}

function setCaffeineDisplay(state)
  if state then
    caffeine:setIcon("active.pdf")
  else
    caffeine:setIcon("inactive.pdf")
  end
end

function caffeineClicked()
  setCaffeineDisplay(hs.caffeinate.toggle("displayIdle"))
end

if caffeine then
  caffeine:setClickCallback(caffeineClicked)
  setCaffeineDisplay(hs.caffeinate.get("displayIdle"))
end

function mod.init()
  -- Always start Caffeine on
  caffeineClicked()
end

return mod
