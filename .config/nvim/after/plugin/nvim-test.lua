require("nvim-test").setup({
  termOpts = {
    direction = "vertical",
    width = 90,
    stopinsert = "false"
  }
})

require("nvim-test.runners.hspec"):setup({
  command = "hspec-test-wrapper",
  args = { "" },
  file_pattern = "\\v(Spec)\\.hs$",
  find_files = { "{name}Spec.hs", "Spec.hs" },
  filename_modifier = "",
})
