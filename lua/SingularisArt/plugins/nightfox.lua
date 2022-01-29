local nightfox_status, nightfox = pcall(require, "nightfox")

if not nightfox_status then
	vim.notify("Please Install 'nightfox'")
	return
end

nightfox.setup({
  fox = "duskfox",
  transparent = true,
  terminal_colors = true,
  styles = {
    comments = "italic",
    keywords = "bold",
    functions = "italic,bold",
  },
  inverse = {
    match_paren = true,
    visual = false,
    search = false,
  },
})

nightfox.load()
vim.cmd("color duskfox")
