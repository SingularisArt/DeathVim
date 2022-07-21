local M = {}

M.load_default_options = function()
	local utils = require("dvim.utils")
	local join_paths = utils.join_paths

	local undodir = join_paths(get_cache_dir(), "undo")

	if not utils.is_directory(undodir) then
		vim.fn.mkdir(undodir, "p")
	end

	local default_options = {
		backup = false, -- creates a backup file
		clipboard = "unnamedplus", -- allows neovim to access the system clipboard
		cmdheight = 2, -- more space in the neovim command line for displaying messages
		completeopt = { "menuone", "noselect" }, -- mostly just for cmp
		fileencoding = "utf-8", -- the encoding written to a file
		hlsearch = true, -- highlight all matches on previous search pattern
		ignorecase = true, -- ignore case in search patterns
		mouse = "a", -- allow the mouse to be used in neovim
		pumheight = 10, -- pop up menu height
		showmode = false, -- we don't need to see things like -- INSERT -- anymore
		showtabline = 2, -- always show tabs
		smarttab = true, -- <tab>/<BS> indent/dedent in leading whitespace
		smartcase = true, -- smart case
		smartindent = true, -- make indenting smarter again
		splitbelow = true, -- force all horizontal splits to go below current window
		splitright = true, -- force all vertical splits to go to the right of current window
		swapfile = false, -- creates a swapfile
		timeoutlen = 500, -- time to wait for a mapped sequence to complete (in milliseconds)
		undofile = true, -- enable persistent undo
		updatetime = 300, -- faster completion (4000ms default)
		writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
		number = true, -- set numbered lines
		relativenumber = true, -- set relative numbered lines
		numberwidth = 2, -- set number column width to 2 {default 4}
		tabstop = 2, -- spaces per tab
		shiftwidth = 2, -- spaces per tab
		expandtab = true, -- spaces per tab
		signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
		wrap = false, -- don't display lines as one long line
		scrolloff = 8, -- scroll when you are 8 lines away from the top/bottom
		cursorline = true, -- highlight the current line
		laststatus = 3, -- make statusline cover the entire bottom
		-- spell = true, -- turn on spell check
	}

	---  SETTINGS  ---
	vim.opt.shortmess:append("c") -- don't show redundant messages from ins-completion-menu
	vim.opt.shortmess:append("I") -- don't show the default intro message
	vim.opt.whichwrap:append("<,>,[,],h,l")

	for k, v in pairs(default_options) do
		vim.opt[k] = v
	end
end

M.load_headless_options = function()
	vim.opt.shortmess = "" -- try to prevent echom from cutting messages off or prompting
	vim.opt.more = false -- don't pause listing when screen is filled
	vim.opt.cmdheight = 9999 -- helps avoiding |hit-enter| prompts.
	vim.opt.columns = 9999 -- set the widest screen possible
	vim.opt.swapfile = false -- don't use a swap file
end

M.load_defaults = function()
	if #vim.api.nvim_list_uis() == 0 then
		M.load_headless_options()
		return
	end
	M.load_default_options()
end

return M
