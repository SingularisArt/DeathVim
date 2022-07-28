local M = {}

M.config = function()
	dvim.lsp.hints = {
		setup = {
			inlay_hints = {
				parameter_hints = {
					show = false,
					-- prefix = "<- ",
					separator = ", ",
				},
				type_hints = {
					-- type and other hints
					show = true,
					prefix = "",
					separator = ", ",
					remove_colon_end = false,
					remove_colon_start = false,
				},
				-- separator between types and parameter hints. Note that type hints are
				-- shown before parameter
				labels_separator = "  ",
				-- whether to align to the length of the longest line in the file
				max_len_align = false,
				-- padding from the left if max_len_align is true
				max_len_align_padding = 1,
				-- whether to align to the extreme right or not
				right_align = false,
				-- padding from the right if right_align is true
				right_align_padding = 7,
				-- highlight group
				highlight = "Comment",
			},
			debug_mode = false,
		},
	}
end

M.setup = function()
	M.config()

  local hints = require_clean("lsp-inlayhints")

	vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
	vim.api.nvim_create_autocmd("LspAttach", {
		group = "LspAttach_inlayhints",
		callback = function(args)
			if not (args.data and args.data.client_id) then
				return
			end

			local client = vim.lsp.get_client_by_id(args.data.client_id)

			if client.server_capabilities.inlayHintProvider then
				require("lsp-inlayhints").on_attach(args.buf, client)
			end
		end,
	})

	hints.setup(dvim.lsp.hints)
end

return M
