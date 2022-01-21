local better_escape_status, better_escape = pcall(require, "better_escape")

if not better_escape_status then
	vim.notify("Please Install 'better_escape'")
	return
end

-- require("better_escape").setup {
better_escape.setup({
  mapping = { "jk", "jj" }, -- a table with mappings to use
  timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
  clear_empty_lines = false, -- clear line after escaping if there is only whitespace
  keys = "<Esc>", -- keys used for escaping, if it is a function will use the result everytime
})
