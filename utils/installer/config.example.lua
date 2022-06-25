------------------------------------------------------------------------
--                              General                               --
------------------------------------------------------------------------

dvim.colorscheme = "onedarker"
dvim.format_on_save = false

------------------------------------------------------------------------
--                                Logging                             --
------------------------------------------------------------------------

-- The level of logging.
-- Possible values: "trace", "debug", "info", "warn", "error", "fatal"
dvim.log.level = "warn"
-- The file to log to. Default is ~/.config/dvim/log.log
dvim.log.out_file = os.getenv("HOME") .. "/.config/dvim/log.log"

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

--------------------------
--  Remove Keymappings  --
--------------------------

------------------------------------------------------------------------
--                              Builtin                               --
------------------------------------------------------------------------

-----------------------
--  Builtin Plugins  --
-----------------------

-- After changing plugin config exit and reopen DeathVim, then
-- Run :PackerSync to reload the plugins.
dvim.builtin.plugins.alpha.active = true
dvim.builtin.plugins.alpha.mode = "dashboard"
dvim.builtin.plugins.indent_blankline.active = true
dvim.builtin.plugins.symbols_outline.active = true
dvim.builtin.plugins.which_key.active = true
dvim.builtin.plugins.gitsigns.active = true
dvim.builtin.plugins.comment.active = true
dvim.builtin.plugins.surround.active = true
dvim.builtin.plugins.todo_comments.active = true
dvim.builtin.plugins.jabs.active = true
dvim.builtin.plugins.terminal.active = true
dvim.builtin.plugins.dap.active = true
dvim.builtin.plugins.alpha.active = true
dvim.builtin.plugins.ultisnips.active = true
dvim.builtin.plugins.telescope.active = true
dvim.builtin.plugins.project.active = true
dvim.builtin.plugins.copilot.active = true
dvim.builtin.plugins.cmp.active = true
dvim.builtin.plugins.autopairs.active = true
dvim.builtin.plugins.nvimtree.active = true
dvim.builtin.plugins.lualine.active = true
dvim.builtin.plugins.bufferline.active = true
dvim.builtin.plugins.notify.active = true
dvim.builtin.plugins.treesitter.active = true
dvim.builtin.plugins.latex.active = true
dvim.builtin.plugins.markdown.active = true

-------------------------
--  Builtin Filetypes  --
-------------------------

-- This is an important list. If you disable a filetype, DeathVim will
-- uninstall it's TreeSitter parser, disable the lsp, formatter, diagnostic and
-- uninstall all plugins related to it.
dvim.builtin.filetypes.lua.active = true
dvim.builtin.filetypes.vim.active = true
dvim.builtin.filetypes.python.active = true
dvim.builtin.filetypes.cpp.active = true
dvim.builtin.filetypes.cmake.active = true
dvim.builtin.filetypes.c.active = true
dvim.builtin.filetypes.cs.active = true
dvim.builtin.filetypes.sql.active = true
dvim.builtin.filetypes.html.active = true
dvim.builtin.filetypes.css.active = true
dvim.builtin.filetypes.js.active = true
dvim.builtin.filetypes.ts.active = true
dvim.builtin.filetypes.php.active = true
dvim.builtin.filetypes.ruby.active = true
dvim.builtin.filetypes.perl.active = true
dvim.builtin.filetypes.java.active = true
dvim.builtin.filetypes.rust.active = true
dvim.builtin.filetypes.bash.active = true
dvim.builtin.filetypes.log.active = true
dvim.builtin.filetypes.latex.active = true
dvim.builtin.filetypes.markdown.active = true
dvim.builtin.filetypes.yaml.active = true
dvim.builtin.filetypes.json.active = true

------------------------------------------------------------------------
--                            Tree Sitter                             --
------------------------------------------------------------------------

-- This list depends on the filetypes list. Don't remove any of the items. Only
-- add new ones and if you want to disable a filetype, set it to false in the
-- filetypes list from above.
-- dvim.builtin.plugins.treesitter.ensure_installed = {
--   { command = "lua", filetype = "lua" },
--   { command = "vim", filetype = "vim" },
--   { command = "python", filetype = "python" },
--   { command = "cpp", filetype = "cpp" },
--   { command = "cmake", filetype = "cmake" },
--   { command = "c", filetype = "c" },
--   { command = "c_sharp", filetype = "cs" },
--   { command = "sql", filetype = "sql" },
--   { command = "html", filetype = "html" },
--   { command = "css", filetype = "css" },
--   { command = "javascript", filetype = "js" },
--   { command = "typescript", filetype = "ts" },
--   { command = "php", filetype = "php" },
--   { command = "ruby", filetype = "ruby" },
--   { command = "perl", filetype = "perl" },
--   { command = "java", filetype = "java" },
--   { command = "rust", filetype = "rust" },
--   { command = "bash", filetype = "bash" },
--   { command = "yaml", filetype = "yaml" },
--   { command = "json", filetype = "json" },
-- }

-- Language servers to not install
-- dvim.builtin.plugins.treesitter.ignore_install = {
--   "latex",
--   "markdown",
-- }

-- Enable highlighting automatically
-- dvim.builtin.plugins.treesitter.highlight.enabled = true
-- Enable indenting automatically
-- dvim.builtin.plugins.treesitter.indent.enabled = true

------------------------------------------------------------------------
--                                LSP                                 --
------------------------------------------------------------------------

------------------------
--  Language Servers  --
------------------------

-- This list depends on the filetypes list. Don't remove any of the items. Only
-- add new ones and if you want to disable a filetype, set it to false in the
-- filetypes list from above.
-- dvim.lsp.language_servers = {
--   { server = "sumneko_lua", filetype = "lua" },
--   { server = "vimls", filetype = "vim" },
--   { server = "texlab", filetype = "latex" },
--   { server = "pylsp", filetype = "python" },
--   { server = "bashls", filetype = "bash" },
--   { server = "clangd", filetype = "cpp" },
--   { server = "cmake", filetype = "cmake" },
--   { server = "html", filetype = "html" },
--   { server = "cssls", filetype = "css" },
--   { server = "jsonls", filetype = "json" },
--   { server = "rust_analyzer", filetype = "rust" },
--   { server = "tsserver", filetype = "js" },
--   { server = "jdtls", filetype = "java" },
--   { server = "yamlls", filetype = "yaml" },
-- }

-- If you don't have a server installed for a filetype, DeathVim will try to
-- install it for you, but it isn't perfect. Always check the log file
-- (~/.config/dvim/log.log) to see if it succeded or failed.
-- dvim.lsp.automatic_servers_installation = true

----------------
-- Formatters --
----------------

-- This list depends on the filetypes list. Don't remove any of the items. Only
-- add new ones and if you want to disable a filetype, set it to false in the
-- filetypes list from above.
-- dvim.lsp.formatters = {
--   {
--     command = "black",
--     extra_args = { "--fast" },
--     filetype = "python",
--   },
--   {
--     command = "clang_format",
--     filetype = "cpp",
--   },
--   {
--     command = "latexindent",
--     filetype = "latex",
--   },
--   {
--     command = "prettier",
--     extra_args = { "--single-quote", "--jsx-single-quote" },
--     filetype = "js",
--   },
--   {
--     command = "rustfmt",
--     filetype = "rust",
--   },
--   {
--     command = "sql_formatter",
--     filetype = "sql",
--   },
--   {
--     command = "standardrb",
--     extra_args = { "--fix", "--format", "quiet", "--stderr", "--stdin", "$FILENAME" },
--     filetype = "ruby",
--   },
--   {
--     command = "stylua",
--     filetype = "lua",
--   },
--   {
--     command = "google_java_format",
--     filetype = "java",
--   },
--   {
--     command = "shellharden",
--     filetype = "bash",
--   },
-- }

-- If you don't have a formatter installed for a filetype, DeathVim will try to
-- install it for you, but it isn't perfect. Always check the log file
-- (~/.config/dvim/log.log) to see if it succeded or failed.
-- dvim.lsp.automatic_formatters_installation = true

-----------------
-- Diagnostics --
-----------------

-- This list depends on the filetypes list. Don't remove any of the items. Only
-- add new ones and if you want to disable a filetype, set it to false in the
-- filetypes list from above.
-- dvim.lsp.diagnostics = {
--   {
--     command = "flake8", filetype = "python",
--   },
--   {
--     command = "cppcheck", filetype = "cpp",
--   },
-- }

-- If you don't have a diagnostic installed for a filetype, DeathVim will try
-- to install it for you, but it isn't perfect. Always check the log file
-- (~/.config/dvim/log.log) to see if it succeded or failed.
-- dvim.lsp.automatic_diagnostics_installation = true

------------------------------------------------------------------------
--                         Additional Plugins                         --
------------------------------------------------------------------------

-- Add any additional plugins you may want
-- dvim.plugins = {
--   {
--     "folke/trouble.nvim",
--     cmd = "TroubleToggle",
--   },
-- }

------------------------------------------------------------------------
--                           Auto Commands                            --
------------------------------------------------------------------------

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })

------------------------------------------------------------------------
--                            Vim Commands                            --
------------------------------------------------------------------------

-- dvim.vim_commands = {
--   { command = "set rtp+=~/Documents/notes/school-notes/current-course" },
-- }
