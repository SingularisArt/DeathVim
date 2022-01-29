local scrollbar_status, scrollbar = pcall(require, "scrollbar")

if not scrollbar_status then
	vim.notify("Please Install 'nvim-scrollbar'")
	return
end

local handle = { text = " ", color = "white" }
local marks = {
  Error = { color = "red" },
  Info = { color = "blue" },
  Hint = { color = "green" },
  Warn = { color = "yellow" },
  Misc = { color = "purple" },
  Search = { color = "orange" },
}

scrollbar.setup({
  marks = marks,
  handle = handle,
  excluded_filetypes = { "nvimtree", "NvimTree" },
})
