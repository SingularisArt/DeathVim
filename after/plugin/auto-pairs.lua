local airline_status, autopairs = pcall(require, "nvim-autopairs")

if not airline_status then
	vim.notify("Please Install 'nvim-autopairs'")
	return
end

autopairs.setup({})
