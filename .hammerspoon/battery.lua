-- Modified version of
-- https://github.com/code2k/.hammerspoon/blob/github/hardware.lua

local battery = require "hs.battery"
local logger = hs.logger.new('battery', 'debug')

local mod = {}

local state = {
  min = 5,
  remaining = 0
}

local function watchBattery()
  local currentPercentage = battery.percentage()
  local source = battery.powerSource()
  local isLowerThanMin = currentPercentage <= state.min
  local isBattery = source == 'Battery Power'
  local stateHasChanged = state.remaining ~= currentPercentage

  if isLowerThanMin and stateHasChanged and isBattery then
    state.remaining = math.floor(currentPercentage)
    hs.alert.show("Battery left: " .. state.remaining .. "%")
  end
end

function mod.init()
  battery.watcher.new(watchBattery):start()
end

return mod
