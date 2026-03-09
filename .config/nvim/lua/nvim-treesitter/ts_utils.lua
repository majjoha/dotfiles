-- Compatibility shim: nvim-treesitter main dropped ts_utils.
-- Implements only the subset used by nvim-test.
return {
  get_node_at_cursor = function()
    return vim.treesitter.get_node()
  end,
}
