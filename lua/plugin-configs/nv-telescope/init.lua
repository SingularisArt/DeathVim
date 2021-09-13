local actions = require('telescope.actions')
require('telescope').setup{
	defaults = {
		file_sorter = require('telescope.sorters').get_fzy_sorter,
		prompt = ' >',
		color_devicons = true,

		file_previewer = 		require('telescope.previewers').vim_buffer_cat.new,
		grep_previewer = 		require('telescope.previewers').vim_buffer_vimgrep.new,
		qflist_previewer = 	require('telescope.previewers').vim_buffer_qflist.new,

		mappings = {
			i = {
				["<C-x>"] = false,
				["<C-q>"] = actions.send_to_qflist,
			},
		}
	},
	extensions = {
		fzy_native = {
			override_generic_sorter = false,
			override_file_sorter = true,
		}
	}
}

require('telescope')
