local tabnine_status, tabnine = pcall(require, "cmp_tabnine.config")

if not tabnine_status then
	vim.notify("Please Install 'tabnine'")
	return
end

tabnine:setup({
	max_lines = 1000,
	max_num_results = 50,
	sort = true,
	run_on_every_keystroke = true,
	snippet_placeholder = "..",
	ignored_file_types = { -- default is not to ignore
		-- uncomment to ignore in lua:
		-- lua = true
	},
})
