-- Utility function for escaping terminal keycodes
-- Source: https://github.com/nanotee/nvim-lua-guide#vimapinvim_replace_termcodes
function _G.t(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

-- If a snippet exists for the current text, expand it with `<Tab>`
-- If a completion menu is visible, select the current item with `<Tab>`
-- Otherwise just trigger a `<Tab>`
function _G.smart_tab()
  if vim.fn.call("neosnippet#expandable_or_jumpable", {}) then
    return t("<Plug>(neosnippet_expand_or_jump)")
  elseif vim.fn.pumvisible() then
    return t("<C-y>")
  else
    return t("<Tab>")
  end
end

-- In completion menus, use `j` to select the next item, and in all other cases
-- to move down a line
function _G.smart_j()
  return vim.fn.pumvisible() and t("<C-n>") or "j"
end

-- In completion menus, use `k` to select the previous item, and in all other
-- cases to move up a line
function _G.smart_k()
  return vim.fn.pumvisible() and t("<C-p>") or "k"
end

-- Use `<Esc>` to return to normal mode in terminals unless the terminal is
-- running FZF
function _G.smart_esc()
  return vim.bo.filetype == "fzf" and t("<Esc>") or t("<C-\\><C-n>")
end

-- Search branches using FZF
function _G.fzf_search_branches()
  vim.fn["fzf#run"](vim.fn["fzf#wrap"]({
    source = "git branch --sort=-committerdate | sed 's/.* //'",
    sink = "!git checkout ",
    options = "+m --prompt='Branch >' --preview='git show --color=always {}'",
  }))
end
