require "reline"

Reline::Face.config(:completion_dialog) do |conf|
  conf.define :default,   foreground: "#2f2f2d", background: "#e3dbd0"
  conf.define :enhanced,  foreground: "#f4efe7", background: "#7c7e44"
  conf.define :scrollbar, foreground: "#7c7e44", background: "#cbbda9"
end
