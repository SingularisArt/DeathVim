vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

local indent_blankline_status, indent_blankline = pcall(require, "indent_blankline")

if not indent_blankline_status then
	vim.notify("Please Install 'indent_blankline'")
	return
end

indent_blankline.setup {
  char = ' ',
  context_char = '│',
  show_current_context = true,
  buftype_exclude = { "terminal" }
}
