-- Compatibility shim: nvim-treesitter main turned parsers.lua into a
-- static data table, dropping ft_to_lang(). The core API is equivalent.
return {
  ft_to_lang = function(filetype)
    return vim.treesitter.language.get_lang(filetype) or filetype
  end,
}
