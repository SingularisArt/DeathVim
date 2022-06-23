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
		["<Leader>o"] = ":only<CR>",
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

------------------------------------------------------------------------
--              Work Around until I get Which Key fixed               --
------------------------------------------------------------------------

local map = function(key)
	-- get the extra options
	local opts = { noremap = true }
	for i, v in pairs(key) do
		if type(i) == "string" then
			opts[i] = v
		end
	end

	-- basic support for buffer-scoped keybindings
	local buffer = opts.buffer
	opts.buffer = nil

	if buffer then
		vim.api.nvim_buf_set_keymap(0, key[1], key[2], key[3], opts)
	else
		vim.api.nvim_set_keymap(key[1], key[2], key[3], opts)
	end
end

-- packer mappings
map({ "n", "<Leader>pi", ":PackerInstall" })
map({ "n", "<Leader>pu", ":PackerUpdate" })
map({ "n", "<Leader>pc", ":PackerClean" })
map({ "n", "<Leader>pl", ":PackerLoad" })
map({ "n", "<Leader>ps", ":PackerSync" })
map({ "n", "<Leader>pp", ":PackerProfile" })

-- buffers
map({ "n", "<Leader>bp", ":BufferLinePick<CR>" })
map({ "n", "<Leader>bcl", ":BufferLineCloseLeft<CR>" })
map({ "n", "<Leader>bcr", ":BufferLineCloseRight<CR>" })
map({ "n", "<Leader>bmn", ":BufferLineMoveNext<CR>" })
map({ "n", "<Leader>bmp", ":BufferLineMovePrev<CR>" })
map({ "n", "<Leader>bsd", ":BufferLineSortByDirectory<CR>" })
map({ "n", "<Leader>bse", ":BufferLineSortByExtension<CR>" })
map({ "n", "<Leader>bsr", ":BufferLineSortByRelativeDirectory<CR>" })
map({ "n", "<Leader>bst", ":BufferLineSortByTabs<CR>" })

-- jabs
map({ "n", "`", ":JABSOpen<CR>" })

-- git
map({ "n", "<Leader>gs", ":Git<CR>" })
map({ "n", "<Leader>ga", ":Git add .<CR>" })
map({ "n", "<Leader>gc", ":Git commit<CR>" })
map({ "n", "<Leader>gp", ":Git push<CR>" })
map({ "n", "<Leader>gP", ":Git pull<CR>" })
map({ "n", "<Leader>gl", ":Git log<CR>" })
map({ "n", "<Leader>gd", ":Git diff<CR>" })
map({ "n", "<Leader>gL", ":LazyGit<CR>" })
map({ "n", "<Leader>gf", ":LazyGitFilter<CR>" })

-- translate
map({ "n", "<Leader>Tt", ":Translate<CR>" })
map({ "n", "<Leader>Tw", ":TranslateW<CR>" })
map({ "n", "<Leader>Tr", ":TranslateR<CR>" })

-- vimtex
map({ "n", "<Leader>lll", ":VimtexClean<CR>" })
map({ "n", "<Leader>llc", ":VimtexCache<CR>" })
map({ "n", "<Leader>lcc", ":VimtexCompile<CR>" })
map({ "n", "<Leader>lco", ":VimtexCompileOutput<CR>" })
map({ "n", "<Leader>lcs", ":VimtexCompileSS<CR>" })
map({ "n", "<Leader>lce", ":VimtexCompileSelected<CR>" })
map({ "n", "<Leader>lrr", ":VimtexReload<CR>" })
map({ "n", "<Leader>lrs", ":VimtexReloadState<CR>" })
map({ "n", "<Leader>lop", ":VimtexStop<CR>" })
map({ "n", "<Leader>loa", ":VimtexStopAll<CR>" })
map({ "n", "<Leader>lto", ":VimtexTocOpen<CR>" })
map({ "n", "<Leader>ltt", ":VimtexTocToggle<CR>" })
map({ "n", "<Leader>lm", ":VimtexContextMenu<CR>" })
map({ "n", "<Leader>lu", ":VimtexCountLetters<CR>" })
map({ "n", "<Leader>lw", ":VimtexCountWords<CR>" })
map({ "n", "<Leader>ld", ":VimtexDocPackage<CR>" })
map({ "n", "<Leader>le", ":VimtexErrors<CR>" })
map({ "n", "<Leader>ls", ":VimtexStatus<CR>" })
map({ "n", "<Leader>la", ":VimtexToggleMain<CR>" })
map({ "n", "<Leader>lv", ":VimtexView<CR>" })
map({ "n", "<Leader>li", ":VimtexInfo<CR>" })

-- markdown
map({ "n", "<Leader>mp", ":MarkdownPreview<CR>" })

-- table
map({ "n", "<Leader>tt", ":TableModeToggle<CR>" })
map({ "n", "<Leader>tf", ":TableAddFormula<CR>" })
map({ "n", "<Leader>tn", "<Leader>t?" })
map({ "n", "<Leader>tdr", "<Leader>tdr" })
map({ "n", "<Leader>tdc", "<Leader>tdc" })
map({ "n", "<Leader>tic", "<Leader>tic" })

-- telescope
map({ "n", "<Leader>fff", ":Telescope find_files<CR>" })
map({ "n", "<Leader>ffb", ':lua require("telescope").extensions.file_browser.file_browser()<CR>' })
map({ "n", "<Leader>fgs", ":Telescope git_status<CR>" })
map({ "n", "<Leader>fgf", ":Telescope git_files<CR>" })
map({ "n", "<Leader>fgc", ":Telescope git_commits<CR>" })
map({ "n", "<Leader>fgb", ":Telescope git_branches<CR>" })
map({ "n", "<Leader>fgt", ":Telescope git_stash<CR>" })
map({ "n", "<Leader>fo", ":Telescope oldfiles<CR>" })
map({ "n", "<Leader>fc", ":Telescope colorscheme<CR>" })
map({ "n", "<Leader>fb", ":Telescope buffers<CR>" })
map({ "n", "<Leader>fm", ":Telescope commands<CR>" })
map({ "n", "<Leader>fq", ":Telescope quick_fix<CR>" })
map({ "n", "<Leader>fl", ":Telescope live_grep<CR>" })
map({ "n", "<Leader>fr", ":Telescope marks<CR>" })
map({ "n", "<Leader>fp", ":Telescope projects<CR>" })

-- nvim-dap
map({ "n", "<Leader>dR", ":lua require(dap').run_to_cursor()" })
map({ "n", "<Leader>dE", ":lua require(dapui').eval(vim.fn.input '[Expression] > ')" })
map({ "n", "<Leader>dC", ":lua require(dap').set_breakpoint(vim.fn.input '[Condition] > ')" })
map({ "n", "<Leader>dU", ":lua require(dapui').toggle()" })
map({ "n", "<Leader>db", ":lua require(dap').step_back()" })
map({ "n", "<Leader>dc", ":lua require(dap').continue()" })
map({ "n", "<Leader>dd", ":lua require(dap').disconnect()" })
map({ "n", "<Leader>de", ":lua require(dapui').eval()" })
map({ "n", "<Leader>dg", ":lua require(dap').session()" })
map({ "n", "<Leader>dh", ":lua require(dap.ui.widgets').hover()" })
map({ "n", "<Leader>dS", ":lua require(dap.ui.widgets').scopes()" })
map({ "n", "<Leader>di", ":lua require(dap').step_into()" })
map({ "n", "<Leader>do", ":lua require(dap').step_over()" })
map({ "n", "<Leader>dp", ":lua require(dap').pause.toggle()" })
map({ "n", "<Leader>dq", ":lua require(dap').close()" })
map({ "n", "<Leader>dr", ":lua require(dap').repl.toggle()" })
map({ "n", "<Leader>ds", ":lua require(dap').continue()" })
map({ "n", "<Leader>dt", ":lua require(dap').toggle_breakpoint()" })
map({ "n", "<Leader>dx", ":lua require(dap').terminate()" })
map({ "n", "<Leader>du", ":lua require(dap').step_out()" })

-- lsp
map({ "n", "<Leader>sdd", ":lua vim.lsp.buf.definition()<CR>" })
map({ "n", "<Leader>sdr", ":lua vim.lsp.buf.references()<CR>" })
map({ "n", "<Leader>sdt", ":lua vim.lsp.buf.type_definition()<CR>" })
map({ "n", "<Leader>sdp", ":lua require('goto-preview').goto_preview_definition()<CR>" })
map({ "n", "<Leader>swa", ":lua vim.lsp.buf.add_workspace_folder()<CR>" })
map({ "n", "<Leader>swr", ":lua vim.lsp.buf.remove_workspace_folder()<CR>" })
map({ "n", "<Leader>sh", ":lua vim.lsp.buf.hover()<CR>" })
map({ "n", "<Leader>sc", ":lua vim.lsp.buf.code_action()<CR>" })
map({ "n", "<Leader>se", ":lua vim.diagnostic.open_float()<CR>" })
map({ "n", "<Leader>sq", ":lua vim.lsp.diagnostic.set_loclist()<CR>" })
map({ "n", "<Leader>sf", ":lua vim.lsp.buf.format { async = true }<CR>" })
map({ "n", "<Leader>sr", ":lua vim.lsp.buf.rename()<CR>" })
map({ "n", "<Leader>si", ":lua require('goto-preview').goto_preview_implementation()<CR>" })
map({ "n", "<Leader>sj", ":lua vim.diagnostic.goto_next()<CR>" })
map({ "n", "<Leader>sk", ":lua vim.diagnostic.goto_prev()<CR>" })
map({ "n", "<Leader>sC", ":lua require('goto-preview').close_all_win()<CR>" })

-- other
map({ "n", "<Leader>y", "<Plug>(easymotion-bd-f)" }) -- Easymotion
map({ "n", "<Leader>e", ":NvimTreeToggle<CR>" }) -- Toggle NvimTree
map({ "n", "<Leader>u", ":SymbolsOutline<CR>" }) -- Togle SymbolsOutline

-- inkscape
map({
	"n",
	"<C-f>",
	":silent exec '!inkscape-figures edit \"'.b:vimtex.root.'/figures/\" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>",
})
map({
	"i",
	"<C-f>",
	"<Esc>:silent exec '.!inkscape-figures create \"'.getline('.').'\" \"'.b:vimtex.root.'/figures/\"'<CR>",
})

return M
