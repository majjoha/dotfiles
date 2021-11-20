-- Utility function for escaping terminal keycodes
-- Source: https://github.com/nanotee/nvim-lua-guide#vimapinvim_replace_termcodes
function _G.t(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
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
