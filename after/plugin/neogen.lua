local neogen_status, neogen = pcall(require, "neogen")

if not neogen_status then
	vim.notify("Please Install 'neogen'")
	return
end

neogen.setup {
    enabled = true
}