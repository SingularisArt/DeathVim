local tabnine = SingularisArt.call('cmp_tabnine.config', 'Tabnine')

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
