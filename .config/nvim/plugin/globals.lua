-- Utility function for escaping terminal keycodes
-- Source: https://github.com/nanotee/nvim-lua-guide#vimapinvim_replace_termcodes
function _G.t(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

-- Expand snippet if a snippet exists, otherwise trigger a `<Tab>`
function _G.supertab()
  return vim.fn.call("neosnippet#expandable_or_jumpable", {}) == 1 and
           t("<Plug>(neosnippet_expand_or_jump)") or t("<Tab>")
end

-- In completion menus, use `j` to select the next item, and in all other cases
-- to move down a line
function _G.smart_j()
  return vim.fn.pumvisible() == 1 and t("<C-n>") or "j"
end

-- In completion menus, use `k` to select the previous item, and in all other
-- cases to move up a line
function _G.smart_k()
  return vim.fn.pumvisible() == 1 and t("<C-p>") or "k"
end

-- In completion menus, use `<Tab>` to select an item, and in all other cases to
-- trigger a `<Tab>`
function _G.smart_tab()
  return vim.fn.pumvisible() == 1 and t("<C-y><Tab>") or t("<Tab>")
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
