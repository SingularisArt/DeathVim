vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

local indent_blankline_status, indent_blankline = pcall(require, "indent_blankline")

if not indent_blankline_status then
	vim.notify("Please Install 'indent_blankline'")
	return
end

indent_blankline.setup({
	show_end_of_line = true,
	space_char_blankline = " ",
	buftype_exclude = { "terminal" },
	filetype_exclude = { "dashboard", "help", "packer", "lsp-installer" },
})
