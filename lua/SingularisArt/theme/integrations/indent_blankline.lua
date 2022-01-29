local M = {}

function M.get(cp)

	local hi = {
		IndentBlanklineChar = { fg = cp.black3 },
		IndentBlanklineContextChar = { fg = cp.black3 },
	}

	return hi
end

return M
