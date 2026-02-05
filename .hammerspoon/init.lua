-- Disable animation when repositioning windows
hs.window.animationDuration = 0

hs.loadSpoon("SpoonInstall")

local hyper = { "ctrl", "alt" }

hs.hints.style = "vimperator"
hs.hints.fontName = "SFPro-Regular"
hs.hints.fontSize = 20
local focused = hs.window.focusedWindow()
if focused then
  hs.hints.windowHints(focused:application():allWindows())
end
hs.hotkey.bind(hyper, "Space", hs.hints.windowHints)

-- Load all spoons with their respective settings
for plugin, configuration in pairs({
  AppLauncher = {
    hotkeys = {
      c = "Calendar",
      d = "Discord",
      f = "Finder",
      m = "Music",
      n = "Notes",
      p = "1Password 7",
      r = "Reeder",
      s = "Firefox Developer Edition",
      t = "Ghostty",
      z = "zoom.us",
    },
  },
  Caffeine = {
    fn = function(caffeine)
      caffeine:start():setState(true)
    end,
  },
  EmmyLua = {},
  FnMate = {},
  ReloadConfiguration = { start = true },
  SkyRocket = {
    fn = function(skyrocket)
      skyrocket:new({
        opacity = 0.3,
        moveModifiers = { "cmd", "alt", "shift" },
        resizeModifiers = { "alt", "shift" },
      })
    end,
  },
  Shoji = {
    fn = function(shoji)
      local Modifiers = require("layouts.modifiers")
      local Fullscreen = require("layouts.fullscreen")
      local CenteredFullscreen = Modifiers.chain(
        Fullscreen,
        Modifiers.Gaps.create({ outer = 0 }),
        Modifiers.Centered.ratio(0.9)
      )

      shoji:start({
        gap_outer = 5,
        gap_inner = 5,
        main_ratio = 0.5,
        default_layout = "fullscreen",
        layouts = { CenteredFullscreen },
        alert_duration = 1,
        enabled_layouts = {
          "fullscreen",
          "tall",
          "fullscreen+gaps+centered",
        },
        retile_on_focus = true,
        drag_swap = true,
        drag_min_distance = 25,
        drag_swap_sensitivity = 0.8,
        filter_mode = "allowlist",
        filter_apps = {
          "br.com.marcosatanaka.music-harbor",
          "ch.protonvpn.mac",
          "com.agilebits.onepassword7",
          "com.apple.ActivityMonitor",
          "com.apple.AppStore",
          "com.apple.Dictionary",
          "com.apple.DiskUtility",
          "com.apple.Home",
          "com.apple.iCal",
          "com.apple.logic10",
          "com.apple.Maps",
          "com.apple.MobileSMS",
          "com.apple.Music",
          "com.apple.Notes",
          "com.apple.Passwords",
          "com.apple.Photos",
          "com.apple.Preview",
          "com.apple.Safari",
          "com.apple.SafariTechnologyPreview",
          "com.apple.shortcuts",
          "com.apple.TextEdit",
          "com.apple.VoiceMemos",
          "com.apple.weather",
          "com.coppertino.Vox",
          "com.electron.realtimeboard",
          "com.elsevier.mendeley",
          "com.figma.Desktop",
          "com.firecore.infuse",
          "com.github.wez.wezterm",
          "com.google.Chrome",
          "com.hnc.Discord",
          "com.kagi.kagimacOS",
          "com.kishanbagaria.jack",
          "com.microsoft.VSCode",
          "com.mitchellh.ghostty",
          "com.plugdata.plugdata",
          "com.pokemonshowdown.pokemonshowdown",
          "com.reederapp.5.macOS",
          "com.spotify.client",
          "com.tinyspeck.slackmacgap",
          "com.todoist.mac.Todoist",
          "com.uranusjr.macdown",
          "com.yourcompany.SoulseekQt",
          "jp.co.korg.volcaSampleLibrarian",
          "md.obsidian",
          "net.ankiweb.dtop",
          "net.kovidgoyal.calibre",
          "net.kovidgoyal.kitty",
          "net.sourceforge.supercollider",
          "org.hammerspoon.Hammerspoon",
          "org.libreoffice.script",
          "org.m0k.transmission",
          "org.mozilla.firefoxdeveloperedition",
          "org.musescore.MuseScore",
          "org.openemu.OpenEmu",
          "org.videolan.vlc",
          "us.zoom.xos",
        },
      })
    end,
    hotkeys = {
      focus_left = {},
      focus_right = {},
      focus_up = {},
      focus_down = {},
      focus_prev = { { "ctrl", "alt" }, ";" },
      focus_next = { { "ctrl", "alt" }, "'" },
      swap_left = {},
      swap_right = {},
      swap_up = {},
      swap_down = {},
      swap_prev = { { "cmd", "ctrl", "alt" }, ";" },
      swap_next = { { "cmd", "ctrl", "alt" }, "'" },
      swap_main = { { "cmd", "ctrl", "alt" }, "return" },
      cycle_layout_forward = { { "cmd", "ctrl", "alt" }, "space" },
      cycle_layout_backward = { { "cmd", "ctrl", "alt", "shift" }, "space" },
      increase_main_ratio = { { "ctrl", "alt" }, "." },
      decrease_main_ratio = { { "ctrl", "alt" }, "," },
      increase_nmaster = { { "cmd", "alt", "shift" }, "i" },
      decrease_nmaster = { { "cmd", "alt", "shift" }, "d" },
      toggle_float = { { "ctrl", "alt", "shift" }, "t" },
      retile_space = { { "cmd", "alt" }, "r" },
    },
  },
  Spatial = {
    start = true,
    config = {
      activeSpaceIcon = function()
        return "⦁ "
      end,
      inactiveSpaceIcon = function()
        return "⸱ "
      end,
    },
  },
}) do
  spoon.SpoonInstall:andUse(plugin, configuration)
end

hs.alert.show("Config loaded")
