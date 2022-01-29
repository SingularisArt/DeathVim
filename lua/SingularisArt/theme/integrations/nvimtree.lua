local M = {}

function M.get(cp)
	return {
		NvimTreeFolderName = { fg = cp.blue },
		NvimTreeFolderIcon = { fg = cp.gray1 },
		NvimTreeNormal = { fg = cp.white, bg = cp.black1 },
		NvimTreeOpenedFolderName = { fg = cp.blue },
		NvimTreeEmptyFolderName = { fg = cp.blue },
		NvimTreeIndentMarker = { fg = cp.black3 },
		NvimTreeVertSplit = { fg = cp.black1, bg = cp.black1 },
		NvimTreeRootFolder = { fg = cp.flamingo, style = "italic,undercurl" },
		NvimTreeSymlink = { fg = cp.pink },
		NvimTreeStatuslineNc = { fg = cp.black1, bg = cp.black1 },
		NvimTreeStatusline = { fg = cp.black1, bg = cp.black1 },
		NvimTreeGitDirty = { fg = cp.yellow },
		NvimTreeGitNew = { fg = cp.blue },
		NvimTreeGitDeleted = { fg = cp.red },
		NvimTreeSpecialFile = { fg = cp.sky },
		NvimTreeImageFile = { fg = cp.white },
		NvimTreeOpenedFile = { fg = cp.pink },
	}
end

return M
