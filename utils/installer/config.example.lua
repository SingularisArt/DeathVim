-- For more information, see:
-- https://github.com/SingularisArt/Death.NeoVim/wiki/Modifying-the-config.lua-file

------------------------------------------------------------------------
--                              General                               --
------------------------------------------------------------------------

dvim.colorscheme = "rose-pine"
dvim.format_on_save = true

------------------------------------------------------------------------
--                                Logging                             --
------------------------------------------------------------------------

-- The level of logging.
-- Possible values: "trace", "debug", "info", "warn", "error", "fatal"
dvim.log.level = "trace"
-- The file to log to. Default is ~/.cache/dvim/dvim.log
dvim.log.out_file = get_cache_dir() .. "/dvim.log"

------------------------------------------------------------------------
--                         TODO: Keymappings                          --
------------------------------------------------------------------------

-------------
--  Setup  --
-------------

dvim.leader = " "

-----------------------
--  Add Keymappings  --
-----------------------

dvim.keys.normal_mode["<C-s>"] = ":w<cr>"
dvim.keys.normal_mode["<C-f>"] =
	":silent exec '!inkscape-figures edit \"'.b:vimtex.root.'/figures/\" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>"
dvim.keys.insert_mode["<C-f>"] =
	"<Esc>:silent exec '.!inkscape-figures create \"'.getline('.').'\" \"'.b:vimtex.root.'/figures/\"'<CR>"

--------------------------
--  Which Key Bindings  --
--------------------------

dvim.builtin.plugins.which_key.mappings["r"] = {
	name = "+Trouble",
	r = { "<cmd>Trouble lsp_references<cr>", "References" },
	f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
	d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
	q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
	l = { "<cmd>Trouble loclist<cr>", "LocationList" },
	w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
}

--------------------------
--  Remove Keymappings  --
--------------------------

-- Ctrl+a highlights everything
dvim.keys.normal_mode["<C-a>"] = ""

------------------------------------------------------------------------
--                              Builtin                               --
------------------------------------------------------------------------

-----------------------
--  Builtin Plugins  --
-----------------------

-- After changing plugin config exit and reopen DeathVim, then
-- Run :PackerSync to reload the plugins.
dvim.builtin.plugins = {
	alpha = { active = true, mode = "dashboard" },
	indent_blankline = { active = true },
	symbols_outline = { active = true },
	which_key = { active = true },
	gitsigns = { active = true },
	comment = { active = true },
	surround = { active = true },
	todo_comments = { active = true },
	terminal = { active = true },
	dap = { active = true },
	ultisnips = { active = true },
	telescope = { active = true },
	project = { active = true },
	copilot = { active = true },
	cmp = { active = true },
	autopairs = { active = true },
	nvimtree = { active = true },
	lualine = { active = true },
	staline = { active = true },
	bufferline = { active = true },
	notify = { active = true },
	treesitter = { active = true },
	tex = { active = true },
	markdown = { active = true },
	tmux = { active = true },
}

-------------------------
--  Builtin Filetypes  --
-------------------------

-- This is an important list. If you disable a filetype, DeathVim will disable
-- the following for you:
--  It's LSP
--  It's formatter
--  It's diagnostic
--  It's TreeSitter parser
--  It's plugins
-- So, instead of you going through each of those items and disabling them, you
-- can just disable the filetype.
-- After modifying this list, exit and reopen DeathVim, then run :PackerSync.
dvim.builtin.filetypes = {
	lua = { active = true },
	vim = { active = true },
	python = { active = true },
	cpp = { active = true },
	cmake = { active = true },
	c = { active = true },
	c_sharp = { active = true },
	sql = { active = true },
	html = { active = true },
	css = { active = true },
	javascript = { active = true },
	typescript = { active = true },
	php = { active = true },
	ruby = { active = true },
	perl = { active = true },
	java = { active = true },
	rust = { active = true },
	solidity = { active = true },
	go = { active = true },
	bash = { active = true },
	log = { active = true },
	tex = { active = true },
	markdown = { active = true },
	yaml = { active = true },
	json = { active = true },
	toml = { active = true },
}

-----------------------
--  Builtin Actions  --
-----------------------

dvim.builtin.actions = {
	presentation = { active = true },
	writing = { active = true },
}

------------------------------------------------------------------------
--                         Modifying Plugins                          --
------------------------------------------------------------------------

------------------
--  Statusline  --
------------------

-- Possible values: "staline", "lualine"
dvim.statusline = "staline"
-- Possible values: "evil", "normal" "pebble" "simple" "simpler"
dvim.builtin.plugins.staline.mode = "simple"

-------------------
--  Tree Sitter  --
-------------------

dvim.builtin.plugins.treesitter = {
	-- Install TreeSitter parsers automatically
	sync_install = { enabled = true },
	-- Parsers that are going to be installed by default
	ensure_installed = {
		"lua",
		"vim",
		"python",
		"cpp",
		"cmake",
		"c",
		"c_sharp",
		-- "sql",
		"html",
		"css",
		"javascript",
		"typescript",
		"php",
		"ruby",
		"perl",
		"java",
		"rust",
		"solidity",
		"go",
		"bash",
		"yaml",
		"json",
		"toml",
	},
	-- Language servers to not install
	ignore_install = {
		"latex",
		"markdown",
	},
	-- Enable indenting automatically
	indent = {
		enabled = true,
		disable = {},
	},
	autotag = { enabled = true },
	highlight = {
		-- Enable highlighting automatically
		enabled = true,
		-- Parsers to not highlight
		-- NOTE: This is not the filetype, but the parser name. For example, if you
		-- want to disable the filetype tex, just type latex.
		disable = {
			"latex",
			"markdown",
		},
	},
}

-----------------
--  Which Key  --
-----------------

dvim.builtin.plugins.which_key.marks = true
dvim.builtin.plugins.which_key.presets = {
	operators = false,
	motions = false,
	text_objects = false,
	nav = false,
	z = false,
	g = false,
}
dvim.builtin.plugins.which_key.spelling = {
	enabled = false, -- For some reason, this breaks which key
	suggestions = 20,
}

-----------------
--  Git Signs  --
-----------------

-- Show the git commit message on the line
dvim.builtin.plugins.gitsigns.line_blame = true

------------------------------------------------------------------------
--                                LSP                                 --
------------------------------------------------------------------------

------------------------
--  Language Servers  --
------------------------

-- This list depends on the filetypes list. Don't remove any of the items. Only
-- add new ones and if you want to disable a filetype, set it to false in the
-- filetypes list from above.
dvim.lsp.language_servers = {
	{ server = "sumneko_lua", filetype = "lua" },
	{ server = "vimls", filetype = "vim" },
	{ server = "texlab", filetype = "latex" },
	{ server = "pylsp", filetype = "python" },
	{ server = "bashls", filetype = "bash" },
	{ server = "clangd", filetype = "cpp" },
	{ server = "cmake", filetype = "cmake" },
	{ server = "html", filetype = "html" },
	{ server = "emmet_ls", filetype = "html" },
	{ server = "cssls", filetype = "css" },
	{ server = "tailwindcss", filetype = "css" },
	{ server = "jsonls", filetype = "json" },
	{ server = "rust_analyzer", filetype = "rust" },
	{ server = "solang", filetype = "solidity" },
	{ server = "solc", filetype = "solidity" },
	{ server = "marksman", filetype = "markdown" },
	{ server = "golangci_lint_ls", filetype = "go" },
	{ server = "tsserver", filetype = "javascript" },
	{ server = "jdtls", filetype = "java" },
	{ server = "yamlls", filetype = "yaml" },
}

-- If you don't have a server installed for a filetype, DeathVim will try to
-- install it for you, but it isn't perfect. Always check the log file
-- (~/.config/dvim/log.log) to see if it succeded or failed.
dvim.lsp.automatic_servers_installation = true

----------------
-- Formatters --
----------------

-- This list depends on the filetypes list. Don't remove any of the items. Only
-- add new ones and if you want to disable a filetype, set it to false in the
-- filetypes list from above.
dvim.lsp.formatters = {
	{
		formatter = "black",
		extra_args = { "--fast" },
		filetype = "python",
	},
	{
		formatter = "clang_format",
		filetype = "cpp",
	},
	{
		formatter = "latexindent",
		filetype = "latex",
	},
	{
		formatter = "prettier",
		extra_args = { "--single-quote", "--jsx-single-quote" },
		filetype = "javascript",
	},
	{
		formatter = "rustfmt",
		filetype = "rust",
	},
	{
		formatter = "sql_formatter",
		filetype = "sql",
	},
	{
		formatter = "standardrb",
		extra_args = { "--fix", "--format", "quiet", "--stderr", "--stdin", "$FILENAME" },
		filetype = "ruby",
	},
	{
		formatter = "stylua",
		filetype = "lua",
	},
	{
		formatter = "google_java_format",
		filetype = "java",
	},
	{
		formatter = "shellharden",
		filetype = "bash",
	},
}

-- TODO:
-- If you don't have a formatter installed for a filetype, DeathVim will try to
-- install it for you, but it isn't perfect. Always check the log file
-- (~/.config/dvim/log.log) to see if it succeded or failed.
dvim.lsp.automatic_formatters_installation = true

-----------------
-- Diagnostics --
-----------------

-- This list depends on the filetypes list. Don't remove any of the items. Only
-- add new ones and if you want to disable a filetype, set it to false in the
-- filetypes list from above.
dvim.lsp.diagnostics = {
	{
		diagnostic = "flake8",
		filetype = "python",
	},
	{
		diagnostic = "cppcheck",
		filetype = "cpp",
	},
	{
		diagnostic = "write_good",
		filetype = "latex",
	},
	{
		diagnostic = "write_good",
		filetype = "markdown",
	},
}

-- TODO:
-- If you don't have a diagnostic installed for a filetype, DeathVim will try
-- to install it for you, but it isn't perfect. Always check the log file
-- (~/.config/dvim/log.log) to see if it succeded or failed.
dvim.lsp.automatic_diagnostics_installation = true

-----------
-- Hover --
-----------

dvim.lsp.hovers = {
	{ hover = "dictionary" },
}

-----------------
-- Code Action --
-----------------

dvim.lsp.code_actions = {
	{ code_action = "gitsigns" },
	{ code_action = "gitrebase" },
}

----------------
-- Completion --
----------------

dvim.lsp.completions = {
	{ completion = "spell" },
}

------------------------------------------------------------------------
--                         Additional Plugins                         --
------------------------------------------------------------------------

-- Add any additional plugins you may want
dvim.plugins = {
	"folke/trouble.nvim",
}

------------------------------------------------------------------------
--                           Auto Commands                            --
------------------------------------------------------------------------

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "*.json", "*.jsonc" },
	-- enable wrap mode for json files only
	command = "setlocal wrap",
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = "zsh",
	callback = function()
		-- let treesitter use bash highlight for zsh files as well
		require("nvim-treesitter.highlight").attach(0, "bash")
	end,
})

------------------------------------------------------------------------
--                            Vim Commands                            --
------------------------------------------------------------------------

dvim.vim_commands = {
	{ command = "set rtp+=~/Documents/school-notes/current-course" },
}
