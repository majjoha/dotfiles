-- Skip if Marginalia is not loaded
if not vim.g.loaded_marginalia then
  return
end

vim.g.marginalia_notes_path = vim.fn.expand(
                                "~/Dropbox/Tekstdokumenter/Wiki/notes")
