-- Compatibility shim: re-exports the real parsers data table with `ft_to_lang`
-- added for nvim-test.
local parsers = dofile(
  vim.fs.joinpath(
    vim.fn.stdpath("config"),
    "pack/packages/start/nvim-treesitter",
    "lua/nvim-treesitter/parsers.lua"
  )
)

parsers.ft_to_lang = function(filetype)
  return vim.treesitter.language.get_lang(filetype) or filetype
end

return parsers
