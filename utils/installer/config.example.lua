-- For more information, see:
-- https://github.com/SingularisArt/DeathVim/wiki/Modifying-the-config.lua-file

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
dvim.builtin.plugins = {
  alpha = { active = true, mode = "dashboard" },
  indent_blankline = { active = true },
  symbols_outline = { active = true },
  which_key = { active = true },
  gitsigns = { active = true },
  comment = { active = true },
  surround = { active = true },
  todo_comments = { active = true },
  jabs = { active = true },
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
  bufferline = { active = true },
  notify = { active = true },
  treesitter = { active = true },
  latex = { active = true },
  markdown = { active = true },
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
  bash = { active = true },
  log = { active = true },
  latex = { active = true },
  markdown = { active = true },
  yaml = { active = true },
  json = { active = true },
}


------------------------------------------------------------------------
--                            Tree Sitter                             --
------------------------------------------------------------------------

-- This list depends on the filetypes list. Don't remove any of the items. Only
-- add new ones and if you want to disable a filetype, set it to false in the
-- filetypes list from above.
-- dvim.builtin.plugins.treesitter.ensure_installed = {
--   { parser = "lua", filetype = "lua" },
--   { parser = "vim", filetype = "vim" },
--   { parser = "python", filetype = "python" },
--   { parser = "cpp", filetype = "cpp" },
--   { parser = "cmake", filetype = "cmake" },
--   { parser = "c", filetype = "c" },
--   { parser = "c_sharp", filetype = "c_sharp" },
--   { parser = "sql", filetype = "sql" },
--   { parser = "html", filetype = "html" },
--   { parser = "css", filetype = "css" },
--   { parser = "javascript", filetype = "javascript" },
--   { parser = "typescript", filetype = "typescript" },
--   { parser = "php", filetype = "php" },
--   { parser = "ruby", filetype = "ruby" },
--   { parser = "perl", filetype = "perl" },
--   { parser = "java", filetype = "java" },
--   { parser = "rust", filetype = "rust" },
--   { parser = "bash", filetype = "bash" },
--   { parser = "yaml", filetype = "yaml" },
--   { parser = "json", filetype = "json" },
-- }

-- Language servers to not install
-- dvim.builtin.plugins.treesitter.ignore_install = {
--   "latex",
--   "markdown",
-- }

dvim.builtin.plugins.treesitter = {
  -- Install TreeSitter parsers automatically
  -- Check the log file for errors or success messages
  -- ~/.config/dvim/log.log
  -- install_parsers_automatically = { enabled = true },
  -- Enable highlighting automatically
  -- highlight = { enabled = true },
  -- Enable indenting automatically
  -- indent = { enabled = true },
}

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
--   { server = "tsserver", filetype = "javascript" },
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
--     formatter = "black",
--     extra_args = { "--fast" },
--     filetype = "python",
--   },
--   {
--     formatter = "clang_format",
--     filetype = "cpp",
--   },
--   {
--     formatter = "latexindent",
--     filetype = "latex",
--   },
--   {
--     formatter = "prettier",
--     extra_args = { "--single-quote", "--jsx-single-quote" },
--     filetype = "javascript",
--   },
--   {
--     formatter = "rustfmt",
--     filetype = "rust",
--   },
--   {
--     formatter = "sql_formatter",
--     filetype = "sql",
--   },
--   {
--     formatter = "standardrb",
--     extra_args = { "--fix", "--format", "quiet", "--stderr", "--stdin", "$FILENAME" },
--     filetype = "ruby",
--   },
--   {
--     formatter = "stylua",
--     filetype = "lua",
--   },
--   {
--     formatter = "google_java_format",
--     filetype = "java",
--   },
--   {
--     formatter = "shellharden",
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
--     diagnostic = "flake8",
--     filetype = "python",
--   },
--   {
--     diagnostic = "cppcheck",
--     filetype = "cpp",
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
