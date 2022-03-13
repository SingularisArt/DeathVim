local indent_blankline_status, indent_blankline = pcall(require, "indent_blankline")

if not indent_blankline_status then
	vim.notify("Please Install 'indent-blankline'")
	return
end

-- vim.opt.list = true
-- vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")

indent_blankline.setup({
	-- space_char_blankline = " ",
  show_end_of_line = true,
  space_char_blankline = " ",
	filetype_exclude = { "NvimTree", "alpha", "Telescope", "Aerial", "aerial", "t", "ToggleTerm" },
})
