local M = {}

local generic_opts_any = { noremap = true, silent = true }

local generic_opts = {
	insert_mode = generic_opts_any,
	normal_mode = generic_opts_any,
	visual_mode = generic_opts_any,
	visual_block_mode = generic_opts_any,
	command_mode = generic_opts_any,
	term_mode = { silent = true },
}

local mode_adapters = {
	insert_mode = "i",
	normal_mode = "n",
	term_mode = "t",
	visual_mode = "v",
	visual_block_mode = "x",
	command_mode = "c",
}

-- leader key
vim.g.mapleader = dvim.leader

local defaults = {
	insert_mode = {
		[","] = ",<c-g>u",
		["."] = ".<c-g>u",
		["!"] = "!<c-g>u",
		["?"] = "?<c-g>u",
		-- Fix any mispelled words
		["<C-l>"] = "<C-g>u<Esc>[s1z=`]a<C-g>u",
		-- Highlight everything
		["<C-a>"] = "<Esc>ggVG",
		-- Delete an entire word
		["<C-H>"] = "<C-W>",
	},

	normal_mode = {
		["<C-Space>"] = "<NOP>",
		["<C-s>"] = "<NOP>",
		["<C-h>"] = "<C-w>h",
		["<C-j>"] = "<C-w>j",
		["<C-k>"] = "<C-w>k",
		["<C-l>"] = "<C-w>l",
		["n"] = "nzzzv",
		["N"] = "Nzzzv",
		["J"] = "mzJ`z",
		["<C-Up>"] = ":resize -2<CR>",
		["<C-Down>"] = ":resize +2<CR>",
		["<C-Left>"] = ":vertical resize -2<CR>",
		["<C-Right>"] = ":vertical resize +2<CR>",
		["<Up>"] = ":cprev<CR>zzzv",
		["<Right>"] = ":copen<CR>",
		["<Down>"] = ":cnext<CR>zzzv",
		["<Left>"] = ":cclose<CR>",
		["<Leader>j"] = ":m . +1<CR>==",
		["<Leader>k"] = ":m . -2<CR>==",
		["<Leader>v"] = ":vsplit<CR>",
		["<Leader>h"] = ":split<CR>",
		-- Delete a buffer
		["<C-w>"] = ":bdelete<CR>",
		-- Create a buffer
		["<C-t>"] = ":tabnew<CR>",
		-- Highlight everything
		["<C-a>"] = "ggVG",
		-- Un-highlight everything
		[";"] = ":nohl<CR>",
	},

	term_mode = {
		-- Terminal window navigation
		["<C-h>"] = "<C-\\><C-N><C-w>h",
		["<C-j>"] = "<C-\\><C-N><C-w>j",
		["<C-k>"] = "<C-\\><C-N><C-w>k",
		["<C-l>"] = "<C-\\><C-N><C-w>l",
	},

	visual_mode = {
		-- Better indenting
		["<"] = "<gv",
		[">"] = ">gv",
		-- Move lines around
		["J"] = ":m '>+1<CR>gv=gv",
		["K"] = ":m '<-2<CR>gv=gv",
	},

	visual_block_mode = {
		-- Move selected line / block of text in visual mode
		["K"] = ":move '<-2<CR>gv-gv",
		["J"] = ":move '>+1<CR>gv-gv",

		-- Move current line / block with Alt-j/k ala vscode.
		["<A-j>"] = ":m '>+1<CR>gv-gv",
		["<A-k>"] = ":m '<-2<CR>gv-gv",
	},

	command_mode = {
		-- navigate tab completion with <c-j> and <c-k>
		-- runs conditionally
		["<C-j>"] = { 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', { expr = true, noremap = true } },
		["<C-k>"] = { 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', { expr = true, noremap = true } },
	},
}

-- Unsets all keybindings defined in keymaps
-- @param keymaps The table of key mappings containing a list per mode (normal_mode, insert_mode, ..)
function M.clear(keymaps)
	local default = M.get_defaults()
	for mode, mappings in pairs(keymaps) do
		local translated_mode = mode_adapters[mode] or mode
		for key, _ in pairs(mappings) do
			-- some plugins may override default bindings that the user hasn't manually overridden
			if
				default[mode][key] ~= nil or (default[translated_mode] ~= nil and default[translated_mode][key] ~= nil)
			then
				pcall(vim.keymap.del, translated_mode, key)
			end
		end
	end
end

-- Set key mappings individually
-- @param mode The keymap mode, can be one of the keys of mode_adapters
-- @param key The key of keymap
-- @param val Can be form as a mapping or tuple of mapping and user defined opt
function M.set_keymaps(mode, key, val)
	local opt = generic_opts[mode] or generic_opts_any
	if type(val) == "table" then
		opt = val[2]
		val = val[1]
	end
	if val then
		vim.keymap.set(mode, key, val, opt)
	else
		pcall(vim.api.nvim_del_keymap, mode, key)
	end
end

-- Load key mappings for a given mode
-- @param mode The keymap mode, can be one of the keys of mode_adapters
-- @param keymaps The list of key mappings
function M.load_mode(mode, keymaps)
	mode = mode_adapters[mode] or mode
	for k, v in pairs(keymaps) do
		M.set_keymaps(mode, k, v)
	end
end

-- Load key mappings for all provided modes
-- @param keymaps A list of key mappings for each mode
function M.load(keymaps)
	keymaps = keymaps or {}
	for mode, mapping in pairs(keymaps) do
		M.load_mode(mode, mapping)
	end
end

-- Load the default keymappings
function M.load_defaults()
	M.load(M.get_defaults())
	dvim.keys = dvim.keys or {}
	for idx, _ in pairs(defaults) do
		if not dvim.keys[idx] then
			dvim.keys[idx] = {}
		end
	end
end

-- Get the default keymappings
function M.get_defaults()
	return defaults
end

return M
