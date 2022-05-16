local indent_blankline = SingularisArt.call('indent_blankline', 'Indent Blankline')

-- vim.opt.list = true
-- vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")

indent_blankline.setup({
	-- space_char_blankline = " ",
  show_end_of_line = true,
  space_char_blankline = " ",
	filetype_exclude = { "NvimTree", "alpha", "Telescope", "Aerial", "aerial", "t", "ToggleTerm" },
})
