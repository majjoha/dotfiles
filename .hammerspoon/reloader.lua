mod = {}

function mod.init()
  -- Reload config on write
  function reloadConfig(files)
    hs.reload()
  end
  hs.pathwatcher.new(os.getenv("HOME") .. "/.env/.hammerspoon/", reloadConfig):start()
  hs.alert.show("Config loaded")
end

return mod
