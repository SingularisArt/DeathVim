local ts_rainbow_status, ts_rainbow = pcall(require, "nvim-treesitter.configs")

if not ts_rainbow_status then
	vim.notify("Please Install 'nvim-treesitter'")
	return
end

ts_rainbow.setup {
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
  }
}

