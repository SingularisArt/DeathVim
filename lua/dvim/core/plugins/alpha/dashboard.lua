local M = {}

function M.get_sections()
	local header = {
		type = "text",
		val = {
      [[ _______   _______      ___      .___________. __    __  ____    ____  __  .___  ___.]],
      [[|       \ |   ____|    /   \     |           ||  |  |  | \   \  /   / |  | |   \/   |]],
      [[|  .--.  ||  |__      /  ^  \    `---|  |----`|  |__|  |  \   \/   /  |  | |  \  /  |]],
      [[|  |  |  ||   __|    /  /_\  \       |  |     |   __   |   \      /   |  | |  |\/|  |]],
      [[|  '--'  ||  |____  /  _____  \      |  |     |  |  |  |    \    /    |  | |  |  |  |]],
      [[|_______/ |_______|/__/     \__\     |__|     |__|  |__|     \__/     |__| |__|  |__|]],
		},
		opts = {
			position = "center",
			hl = "Label",
		},
	}

	local text = require("dvim.interface.text")

	local footer = {
		type = "text",
		val = text.align_center({ width = 0 }, {
			"",
			"https://damrah.netlify.app",
		}, 0.5),
		opts = {
			position = "center",
			hl = "Number",
		},
	}

	local buttons = {
		entries = {
			{ "f", "  Find file", ":Telescope find_files <CR>" },
			{ "e", "  New file", ":ene <BAR> startinsert <CR>" },
			{ "p", "  Find project", ":Telescope projects <CR>" },
			{ "r", "  Recently used files", ":Telescope oldfiles <CR>" },
			{ "t", "  Find text", ":Telescope live_grep <CR>" },
			{ "c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>" },
			{ "q", "  Quit Neovim", ":qa<CR>" },
		},
	}

	return {
		header = header,
		buttons = buttons,
		footer = footer,
	}
end

return M
