local config = {
	term_colors = true,
	styles = {
    strings = "NONE",
		comments = "NONE",
		keywords = "NONE",
    variables = "NONE",
    functions = "italic",
	},
	integrations = {
		cmp = true,
		lsp = true,
		markdown = true,
		nvimtree = true,
		which_key = true,
		telescope = true,
		gitgutter = true,
		bufferline = true,
		treesitter = true,
		indent_blankline = true,
	},
}

return config

