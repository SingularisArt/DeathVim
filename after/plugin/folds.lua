local pretty_fold_status, fold = pcall(require, 'pretty-fold')

if not pretty_fold_status then
	vim.notify("Please Install 'pretty-fold'")
	return
end

local preview = require('pretty-fold.preview')

fold.setup({
  keep_indentation = false,
  fill_char = "━",
  sections = {
    left = { "━ ", function() return string.rep("*", vim.v.foldlevel) end, " ━┫", "content", "┣" },
    right = { "┫ ", "number_of_folded_lines", " ┣━━" },
  }
})

preview.setup_keybinding('h')
