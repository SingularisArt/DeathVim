local which_key = SingularisArt.call('which-key', 'Which Key')

which_key.setup({
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 100, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "double", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "center", -- align columns left, center or right
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
})

-------------------------
-- Single key mappings --
-------------------------

which_key.register({
  e = { "<cmd>NvimTreeToggle<CR>", "Toggle NvimTree" },
  S = { "<cmd>SidebarNvimToggle<CR>", "Toggle SidebarNvim" },
  v = { "<cmd>vsplit<CR>", "Vertical Split" },
  h = { "<cmd>split<CR>", "Horizontal Split" },
  o = { "<cmd>only<CR>", "Tab only" },
  y = { "<Plug>(easymotion-bd-f)", "Easymotion" },
  f = "which_key_ignore",
  c = "which_key_ignore",
  a = "which_key_ignore",
  j = "which_key_ignore",
  k = "which_key_ignore",
  r = "which_key_ignore",
}, { prefix = "<leader>" })

------------------
-- Git Mappings --
------------------

which_key.register({
	g = {
		name = "Git",
		s = { "<cmd>Git<CR>", "Status" },
		a = { "<cmd>Git add .<CR>", "Add" },
		d = { "<cmd>Git diff<CR>", "Diff" },
		c = { "<cmd>Git commit<CR>", "Commit" },
		p = { "<cmd>Git push<CR>", "Push" },
		P = { "<cmd>Git pull<CR>", "Pull" },
		l = { "<cmd>Git log<CR>", "Log" },
		L = { "<cmd>LazyGit<CR>", "LazyGit" },
		f = { "<cmd>LazyGitFilter<CR>", "LazyGitFilter" },
	},
}, { prefix = "<leader>" })

----------------------
-- Minimap Mappings --
----------------------

which_key.register({
	i = {
		name = "Mini Map",
		c = { "<cmd>MinimapClose<CR>", "Close Minimap" },
		o = { "<cmd>MinimapOpen<CR>", "Open Minimap" },
		r = { "<cmd>MinimapRefresh<CR>", "Refresh Minimap" },
		t = { "<cmd>MinimapToggle<CR>", "Toggle Minimap" },
	},
}, { prefix = "<leader>" })

---------------------
-- Plugin Mappings --
---------------------

which_key.register({
	p = {
		name = "Packer",
		i = { "<cmd>PackerInstall<CR>", "Install Plugins" },
		u = { "<cmd>PackerUpdate<CR>", "Update Plugins" },
		c = { "<cmd>PackerClean<CR>", "Clean Plugins" },
		l = { "<cmd>PackerLoad<CR>", "Load Plugins" },
		s = { "<cmd>PackerSync<CR>", "Sync Plugins" },
		p = { "<cmd>PackerProfile<CR>", "Profile  Plugins" },
	},
}, { prefix = "<leader>" })

---------------
-- Translate --
---------------

which_key.register({
	R = {
		name = "Translator",
		t = { "<cmd>Translate<CR>", "Translate" },
		w = { "<cmd>TranslateW<CR>", "Translate output to screen" },
		r = { "<cmd>TranslateR<CR>", "Translate output to file" },
	},
}, { prefix = "<leader>" })

--------------
-- Markdown --
--------------

which_key.register({
	m = {
		name = "Markdown",
		p = { "<cmd>MarkdownPreview<CR>", "View Markdown" },
	},
}, { prefix = "<leader>" })

-----------
-- Table --
-----------

which_key.register({
	t = {
		name = "Table",
		t = { "<cmd>TableModeToggle<CR>", "Toggle Table Mode" },
		a = {
			name = "Add",
			f = { "<cmd>TableAddFormula<CR>", "Add formula" },
		},
		d = {
			name = "Delete",
			r = { "<Leader>tdr", "Delete Table Row" },
			c = { "<Leader>tdc", "Delete Table Column" },
		},
		i = {
			name = "Insert",
			c = { "<Leader>tic", "Insert Table Column" },
		},
	},
}, { prefix = "<leader>" })

------------
-- VimTex --
------------

which_key.register({
	l = {
		name = "VimTex",
		m = { "<cmd>VimtexContextMenu<CR>", "Open Context Menu" },
		u = { "<cmd>VimtexCountLetters<CR>", "Count Letters" },
		w = { "<cmd>VimtexCountWords<CR>", "Count Words" },
		d = { "<cmd>VimtexDocPackage<CR>", "Open Doc for package" },
		e = { "<cmd>VimtexErrors<CR>", "Look at the errors" },
		s = { "<cmd>VimtexStatus<CR>", "Look at the status" },
		a = { "<cmd>VimtexToggleMain<CR>", "Toggle Main" },
		v = { "<cmd>VimtexView<CR>", "View pdf" },
		i = { "<cmd>VimtexInfo<CR>", "Vimtex Info" },
		l = {
			name = "Clean",
			l = { "<cmd>VimtexClean<CR>", "Clean Project" },
			c = { "<cmd>VimtexClean<CR>", "Clean Cache" },
		},
		c = {
			name = "Compile",
			c = { "<cmd>VimtexCompile<CR>", "Compile Project" },
			o = { "<cmd>VimtexCompileOutput<CR>", "Compile Project and Show Output" },
			s = { "<cmd>VimtexCompileSS<CR>", "Compile project super fast" },
			e = { "<cmd>VimtexCompileSelected<CR>", "Compile Selected" },
		},
		r = {
			name = "Reload",
			r = { "<cmd>VimtexReload<CR>", "Reload" },
			s = { "<cmd>VimtexReloadState<CR>", "Reload State" },
		},
		o = {
			name = "Stop",
			p = { "<cmd>VimtexStop<CR>", "Stop" },
			a = { "<cmd>VimtexStopAll<CR>", "Stop All" },
		},
		t = {
			name = "TOC",
			o = { "<cmd>VimtexTocOpen<CR>", "Open TOC" },
			t = { "<cmd>VimtexTocToggle<CR>", "Toggle TOC" },
		},
	},
}, { prefix = "<leader>" })

---------------
-- Telescope --
---------------

which_key.register({
	f = {
		name = "Telescope",
		f = {
			name = "Find",
			f = {
				"<cmd>Telescope find_files<CR>",
				"Fuzzy Find Files",
			},
			b = {
				'<cmd>lua require("telescope").extensions.file_browser.file_browser()<CR>',
				"Browser Find Files",
			},
		},
		g = {
			name = "Git",
			s = {
				"<cmd>Telescope git_status<CR>",
				"Git Status",
			},
			f = {
				"<cmd>Telescope git_files<CR>",
				"Git Files",
			},
			c = {
				"<cmd>Telescope git_commits<CR>",
				"Commits",
			},
			b = {
				"<cmd>Telescope git_branches<CR>",
				"Branches",
			},
			t = {
				"<cmd>Telescope git_stash<CR>",
				"Stash",
			},
		},
	},
}, { prefix = "<leader>" })

---------
-- DAP --
---------

which_key.register({
	d = {
		name = "Debug",
    R = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run to Cursor" },
    E = { "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>", "Evaluate Input" },
    C = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", "Conditional Breakpoint" },
    U = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
    b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
    c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
    d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
    e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
    g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
    h = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables" },
    S = { "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", "Scopes" },
    i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
    o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
    p = { "<cmd>lua require'dap'.pause.toggle()<cr>", "Pause" },
    q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
    r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
    s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
    t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
    x = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
    u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
	},
}, { prefix = "<leader>" })

---------
-- LSP --
---------

which_key.register({
	s = {
		name = "LSP",
		h = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Show Documentation" },
		c = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "List Code Actions" },
    C = { "<cmd>lua require('goto-preview').close_all_win()<CR>", "Close all LSP Windows" },
		e = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Show Diagnostics" },
		q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", "Show List of Diagnostics" },
		f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Format" },
		r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
		i = { "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", "Show the Implementation" },
		j = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Go to Previous Diagnostic" },
		k = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "Go to Next Diagnostic" },
		d = {
			name = "Defintions",
			d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go To Definition" },
			f = { "<cmd>Lspsaga lsp_finder<CR>", "Find all definitions/refrences" },
			r = { "<cmd>lua vim.lsp.buf.references()<CR>", "Find refrences" },
			t = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Find the type" },
			p = { "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", "Preview Definition" },
		},
		w = {
			name = "Workspace",
			a = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", "Add Workspace" },
			r = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", "Remove Workspace" },
		},
	},
}, { prefix = "<leader>" })

-------------
-- Buffers --
-------------

which_key.register({
  b = {
    name = "Buffers",
    c = {
      name = "Close",
      l = { "<cmd>BufferLineCloseLeft<CR>", "Close all buffers to the Left" },
      r = { "<cmd>BufferLineCloseRight<CR>", "Close all buffers to the Right" },
    },
    m = {
      name = "Move",
      f = { "<cmd>BufferLineMoveNext<CR>", "Move buffer Forward" },
      b = { "<cmd>BufferLineMovePrev<CR>", "Move buffer Backward" },
    },
    s = {
      name = "Sort",
      f = { "<cmd>BufferLineSortByDirectory<CR>", "Sort by Directory" },
      e = { "<cmd>BufferLineSortByExtension<CR>", "Sort by Extension" },
      r = { "<cmd>BufferLineSortByRelativeDirectory<CR>", "Sort by Relative Directory" },
      t = { "<cmd>BufferLineSortByTabs<CR>", "Sort by Tabs" },
    },
    p = { "<cmd>BufferLinePick<CR>", "Pick buffer" },
  },
}, { prefix = "<leader>" })

------------
-- Config --
------------

which_key.register({
  D = {
    name = "DeathVim",
    c = { "<cmd>e ~/.config/nvim/init.lua<CR>", "Open DeathVim config" },
    f = { "<cmd>e ~/.config/nvim/init.lua<CR>", "Open DeathVim config" },
    g = { "<cmd>e ~/.config/nvim/init.lua<CR>", "Open DeathVim config" },
    k = { "<cmd>e ~/.config/nvim/init.lua<CR>", "Open DeathVim config" },
  },
}, { prefix = "<leader>" })
