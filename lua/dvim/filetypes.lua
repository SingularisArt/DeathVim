local M = {}

M.load_filetype_settings = function()
	for filetype, filetype_table in pairs(dvim.builtin.filetypes) do
		for command, value in pairs(filetype_table) do
			if command == "active" then
				if value == true then
					vim.api.nvim_create_autocmd("BufEnter", {
						pattern = "*",
						callback = function()
							if vim.bo.filetype == filetype then
								pcall(require, "dvim.core.filetypes." .. filetype)
							end
						end,
					})
				end
			end
		end
	end
end

return M
