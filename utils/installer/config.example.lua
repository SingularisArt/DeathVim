------------------------------------------------------------------------
--                              General                               --
------------------------------------------------------------------------

dvim.colorscheme = "onedarker"
dvim.auto_save = false
dvim.log_level = "warn"

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
-- Run :PackerSync
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

-- TODO: Add configuration for each of these filetypes
-- Also, I need to add way more than this

dvim.builtin.filetypes.python.active = true
dvim.builtin.filetypes.cpp.active = true
dvim.builtin.filetypes.cs.active = true
dvim.builtin.filetypes.c.active = true
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
dvim.builtin.filetypes.latex.active = true
dvim.builtin.filetypes.markdown.active = true
dvim.builtin.filetypes.lua.active = true
dvim.builtin.filetypes.vim.active = true

------------------------------------------------------------------------
--                            Tree Sitter                             --
------------------------------------------------------------------------

-- if you don't want all the parsers change this to a table of the ones you want
-- dvim.builtin.plugins.treesitter.ensure_installed = {
--   "python",
--   "cpp",
--   "cs",
--   "c",
--   "sql",
--   "html",
--   "css",
--   "js",
--   "ts",
--   "php",
--   "ruby",
--   "perl",
--   "java",
--   "rust",
--   "latex",
--   "markdown",
--   "lua",
--   "vim",
-- }

-- dvim.builtin.plugins.treesitter.ignore_install = { "haskell" }
-- dvim.builtin.plugins.treesitter.highlight.enabled = true
-- dvim.builtin.plugins.treesitter.indent.enabled = true

------------------------------------------------------------------------
--                                LSP                                 --
------------------------------------------------------------------------

------------------------
--  Language Servers  --
------------------------

-- dvim.language_servers = {
--   "sumneko_lua", -- Lua
--   "vimls", -- Vim
--   "texlab", -- LaTeX
--   "pylsp", -- Python
--   "bashls", -- Bash
--   "clangd", -- C++,C
--   "cmake", -- CMake
--   "html", -- HTML
--   "cssls", -- CSS
--   "jsonls", -- JSON
--   "rust_analyzer", -- Rust
--   "tsserver", -- Typescript/Javascript
--   "jdtls", -- Java
--   "yamlls", -- Yaml
-- }

-- dvim.lsp.automatic_servers_installation = true

----------------
-- Formatters --
----------------

-- dvim.lsp.formatters = {
--   { command = "black", extra_args = { "--fast" } },
--   { command = "clang_format" },
--   { command = "latexindent" },
--   { command = "prettier", extra_args = { "--single-quote", "--jsx-single-quote" } },
--   { command = "rustfmt" },
--   { command = "sql_formatter" },
--   { command = "standardrb", extra_args = { "--fix", "--format", "quiet", "--stderr", "--stdin", "$FILENAME" } },
--   { command = "stylua" },
--   { command = "google_java_format" },
--   { command = "shellharden" },
-- }

-------------
-- Linters --
-------------

-- dvim.lsp.diagnostics = {
--   { command = "flake8" },
--   { command = "cppcheck" },
-- }

------------------------------------------------------------------------
--                         Additional Plugins                         --
------------------------------------------------------------------------

-- dvim.plugins = {
--   { "folke/tokyonight.nvim" },
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

-- for winbar support
-- vim.api.nvim_create_autocmd("CursorMoved", {
--   callback = function()
--     if vim.bo.filetype ~= "tex" then
--       require("dvim.core.plugins.winbar").setup()
--     end
--   end
-- })
-- vim.api.nvim_create_autocmd("BufWinEnter", {
--   callback = function()
--     if vim.bo.filetype ~= "tex" then
--       require("dvim.core.plugins.winbar").setup()
--     end
--   end
-- })
-- vim.api.nvim_create_autocmd("BufFilePost", {
--   callback = function()
--     if vim.bo.filetype ~= "tex" then
--       require("dvim.core.plugins.winbar").setup()
--     end
--   end
-- })
-- vim.api.nvim_create_autocmd("InsertEnter", {
--   callback = function()
--     if vim.bo.filetype ~= "tex" then
--       require("dvim.core.plugins.winbar").setup()
--     end
--   end
-- })
-- vim.api.nvim_create_autocmd("BufWritePost", {
--   callback = function()
--     if vim.bo.filetype ~= "tex" then
--       require("dvim.core.plugins.winbar").setup()
--     end
--   end
-- })

------------------------------------------------------------------------
--                            Vim Commands                            --
------------------------------------------------------------------------

-- dvim.vim_commands = {
--   { command = "set rtp+=~/Documents/notes/school-notes/current-course" },
-- }
