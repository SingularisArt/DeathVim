-- local M = {}

-- M.config = function()
--   dvim.builtin.which_key = {
--     ---@usage disable which-key completely [not recommended]
--     active = true,
--     on_config_done = nil,
--     setup = {
--       plugins = {
--         marks = true, -- shows a list of your marks on ' and `
--         registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
--         -- the presets plugin, adds help for a bunch of default keybindings in Neovim
--         -- No actual key bindings are created
--         presets = {
--           operators = false, -- adds help for operators like d, y, ...
--           motions = false, -- adds help for motions
--           text_objects = false, -- help for text objects triggered after entering an operator
--           windows = false, -- default bindings on <c-w>
--           nav = true, -- misc bindings to work with windows
--           z = true, -- bindings for folds, spelling and others prefixed with z
--           g = true, -- bindings for prefixed with g
--         },
--         spelling = { enabled = true, suggestions = 20 }, -- use which-key for spelling hints
--       },
--       icons = {
--         breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
--         separator = "➜", -- symbol used between a key and it's label
--         group = "+", -- symbol prepended to a group
--       },
--       popup_mappings = {
--         scroll_down = "<c-d>", -- binding to scroll down inside the popup
--         scroll_up = "<c-u>", -- binding to scroll up inside the popup
--       },
--       window = {
--         border = "single", -- none, single, double, shadow
--         position = "bottom", -- bottom, top
--         margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
--         padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
--         winblend = 0,
--       },
--       layout = {
--         height = { min = 4, max = 25 }, -- min and max height of the columns
--         width = { min = 20, max = 50 }, -- min and max width of the columns
--         spacing = 3, -- spacing between columns
--         align = "left", -- align columns left, center or right
--       },
--       hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
--       ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
--       show_help = true, -- show help message on the command line when the popup is visible
--       triggers = "auto", -- automatically setup triggers
--       -- triggers = {"<leader>"} -- or specify a list manually
--       triggers_blacklist = {
--         -- list of mode / prefixes that should never be hooked by WhichKey
--         -- this is mostly relevant for key maps that start with a native binding
--         -- most people should not need to change this
--         i = { "j", "k" },
--         v = { "j", "k" },
--       },
--     },

--     opts = {
--       mode = "n", -- NORMAL mode
--       prefix = "<leader>",
--       buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
--       silent = true, -- use `silent` when creating keymaps
--       noremap = true, -- use `noremap` when creating keymaps
--       nowait = true, -- use `nowait` when creating keymaps
--     },
--     vopts = {
--       mode = "v", -- VISUAL mode
--       prefix = "<leader>",
--       buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
--       silent = true, -- use `silent` when creating keymaps
--       noremap = true, -- use `noremap` when creating keymaps
--       nowait = true, -- use `nowait` when creating keymaps
--     },
--     -- see https://neovim.io/doc/user/map.html#:map-cmd
--     vmappings = {},
--     mappings = {
--       e = { "<cmd>NvimTreeToggle<CR>", "Toggle NvimTree" },
--       v = { "<cmd>vsplit<CR>", "Vertical Split" },
--       h = { "<cmd>split<CR>", "Horizontal Split" },
--       o = { "<cmd>only<CR>", "Tab only" },
--       y = { "<Plug>(easymotion-bd-f)", "Easymotion" },

--       g = {
--         name = "Git",
--         s = { "<cmd>Git<CR>", "Status" },
--         a = { "<cmd>Git add .<CR>", "Add" },
--         d = { "<cmd>Git diff<CR>", "Diff" },
--         c = { "<cmd>Git commit<CR>", "Commit" },
--         p = { "<cmd>Git push<CR>", "Push" },
--         P = { "<cmd>Git pull<CR>", "Pull" },
--         l = { "<cmd>Git log<CR>", "Log" },
--         L = { "<cmd>LazyGit<CR>", "LazyGit" },
--         f = { "<cmd>LazyGitFilter<CR>", "LazyGitFilter" },
--       },

--       p = {
--         name = "Packer",
--         i = { "<cmd>PackerInstall<CR>", "Install Plugins" },
--         u = { "<cmd>PackerUpdate<CR>", "Update Plugins" },
--         c = { "<cmd>PackerClean<CR>", "Clean Plugins" },
--         l = { "<cmd>PackerLoad<CR>", "Load Plugins" },
--         s = { "<cmd>PackerSync<CR>", "Sync Plugins" },
--         p = { "<cmd>PackerProfile<CR>", "Profile  Plugins" },
--       },

--       T = {
--         name = "Translator",
--         t = { "<cmd>Translate<CR>", "Translate" },
--         w = { "<cmd>TranslateW<CR>", "Translate output to screen" },
--         r = { "<cmd>TranslateR<CR>", "Translate output to file" },
--       },

--       m = {
--         name = "Markdown",
--         p = { "<cmd>MarkdownPreview<CR>", "View Markdown" },
--       },

--       t = {
--         name = "Table",
--         t = { "<cmd>TableModeToggle<CR>", "Enable/Disable Table Mode" },
--         n = { "<Leader>ti", "Get cell info" },
--         f = {
--           name = "Formula",
--           a = { "<cmd>TableAddFormula<CR>", "Add formula" },
--           e = { "<Leader>tfe", "Evaluate formula on current row" },
--         },
--         d = {
--           name = "Delete",
--           r = { "<Leader>tdr", "Delete row" },
--           c = { "<Leader>tdc", "Delete column" },
--         },
--         i = {
--           name = "Insert",
--           c = { "<Leader>tic", "Insert column" },
--         },
--       },

--       l = {
--         name = "VimTex",
--         m = { "<cmd>VimtexContextMenu<CR>", "Open Context Menu" },
--         u = { "<cmd>VimtexCountLetters<CR>", "Count Letters" },
--         w = { "<cmd>VimtexCountWords<CR>", "Count Words" },
--         d = { "<cmd>VimtexDocPackage<CR>", "Open Doc for package" },
--         e = { "<cmd>VimtexErrors<CR>", "Look at the errors" },
--         s = { "<cmd>VimtexStatus<CR>", "Look at the status" },
--         a = { "<cmd>VimtexToggleMain<CR>", "Toggle Main" },
--         v = { "<cmd>VimtexView<CR>", "View pdf" },
--         i = { "<cmd>VimtexInfo<CR>", "Vimtex Info" },
--         l = {
--           name = "Clean",
--           l = { "<cmd>VimtexClean<CR>", "Clean Project" },
--           c = { "<cmd>VimtexClean<CR>", "Clean Cache" },
--         },
--         c = {
--           name = "Compile",
--           c = { "<cmd>VimtexCompile<CR>", "Compile Project" },
--           o = { "<cmd>VimtexCompileOutput<CR>", "Compile Project and Show Output" },
--           s = { "<cmd>VimtexCompileSS<CR>", "Compile project super fast" },
--           e = { "<cmd>VimtexCompileSelected<CR>", "Compile Selected" },
--         },
--         r = {
--           name = "Reload",
--           r = { "<cmd>VimtexReload<CR>", "Reload" },
--           s = { "<cmd>VimtexReloadState<CR>", "Reload State" },
--         },
--         o = {
--           name = "Stop",
--           p = { "<cmd>VimtexStop<CR>", "Stop" },
--           a = { "<cmd>VimtexStopAll<CR>", "Stop All" },
--         },
--         t = {
--           name = "TOC",
--           o = { "<cmd>VimtexTocOpen<CR>", "Open TOC" },
--           t = { "<cmd>VimtexTocToggle<CR>", "Toggle TOC" },
--         },
--       },

--       f = {
--         name = "Telescope",
--         f = {
--           name = "Find",
--           f = {
--             "<cmd>Telescope find_files<CR>",
--             "Fuzzy Find Files",
--           },
--           b = {
--             '<cmd>lua require("telescope").extensions.file_browser.file_browser()<CR>',
--             "Browser Find Files",
--           },
--         },
--         g = {
--           name = "Git",
--           s = {
--             "<cmd>Telescope git_status<CR>",
--             "Git Status",
--           },
--           f = {
--             "<cmd>Telescope git_files<CR>",
--             "Git Files",
--           },
--           c = {
--             "<cmd>Telescope git_commits<CR>",
--             "Commits",
--           },
--           b = {
--             "<cmd>Telescope git_branches<CR>",
--             "Branches",
--           },
--           t = {
--             "<cmd>Telescope git_stash<CR>",
--             "Stash",
--           },
--         },
--       },

--       d = {
--         name = "Debug",
--         R = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run to Cursor" },
--         E = { "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>", "Evaluate Input" },
--         C = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", "Conditional Breakpoint" },
--         U = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
--         b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
--         c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
--         d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
--         e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
--         g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
--         h = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables" },
--         S = { "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", "Scopes" },
--         i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
--         o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
--         p = { "<cmd>lua require'dap'.pause.toggle()<cr>", "Pause" },
--         q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
--         r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
--         s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
--         t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
--         x = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
--         u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
--       },

--       s = {
--         name = "LSP",
--         h = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Show Documentation" },
--         c = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Show code actions" },
--         e = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Show line diagnostics" },
--         q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", "Show QuickFix" },
--         f = { "<cmd>lua vim.lsp.buf.format { async = true }<CR>", "Format" },
--         r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
--         i = { "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", "Go to implementation" },
--         j = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Go to next diagnostic" },
--         k = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "Go to previous diagnostic" },
--         C = { "<cmd>lua require('goto-preview').close_all_win()<CR>", "Close all windows" },
--         d = {
--           name = "Definition",
--           d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to definition" },
--           r = { "<cmd>lua vim.lsp.buf.references()<CR>", "Find references" },
--           t = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Get type definition" },
--           p = { "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", "View definition in pop-up" },
--         },
--         w = {
--           name = "Workspace",
--           a = { "<cmd>lua vim.lsp.buf.add_workspace_folder()", "Add workspace" },
--           r = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()", "Remove workspace" },
--         },
--       },

--       b = {
--         name = "Buffers",
--         p = { "<cmd>BufferLinePick<CR>", "Pick buffer" },
--         c = {
--           name = "Close",
--           l = { "<cmd>BufferLineCloseLeft", "Close all buffers to the left" },
--           r = { "<cmd>BufferLineCloseRight", "Close all buffers to the right" },
--         },
--         m = {
--           name = "Move",
--           n = { "<cmd>BufferLineMoveNext", "Move buffer next" },
--           p = { "<cmd>BufferLineMovePrev", "Move buffer previous" },
--         },
--         s = {
--           name = "Sort",
--           d = { "<cmd>BufferLineSortByDirectory", "Sort by directory" },
--           e = { "<cmd>BufferLineSortByExtension", "Sort by extension" },
--           r = { "<cmd>BufferLineSortByRelativeDirectory", "Sort by relative directory" },
--           t = { "<cmd>BufferLineSortByTabs", "Sort by tabs" },
--         },
--       },
--     },
--   }
-- end

-- M.setup = function()
--   M.config()

--   local which_key = require("which-key")

--   which_key.setup(dvim.builtin.which_key.setup)

--   local opts = dvim.builtin.which_key.opts
--   local vopts = dvim.builtin.which_key.vopts

--   local mappings = dvim.builtin.which_key.mappings
--   local vmappings = dvim.builtin.which_key.vmappings

--   which_key.register(mappings, opts)
--   which_key.register(vmappings, vopts)

--   if dvim.builtin.which_key.on_config_done then
--     dvim.builtin.which_key.on_config_done(which_key)
--   end
-- end

-- return M
--
local M = {}

M.setup = function()
  local wk = require("which-key")

  wk.register({
    f = {
      name = "file", -- optional group name
      f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
      n = { "New File" }, -- just a label. don't create any mapping
      e = "Edit File", -- same as above
      ["1"] = "which_key_ignore",  -- special label to hide it in the popup
      b = { function() print("bar") end, "Foobar" } -- you can also pass functions!
    },
  }, { prefix = " " })
end

return M
