-- For a quickstart guide, please see:
-- https://github.com/SingularisArt/DeathVim/#config-file for a quickstart
-- For more indepth explanation, please see:
-- https://github.com/SingularisArt/DeathVim/wiki/Modifying-the-config.lua-file

------------------------------------------------------------------------
--                              General                               --
------------------------------------------------------------------------

dvim.colorscheme = "rose-pine"
dvim.format_on_save = false

------------------------------------------------------------------------
--                                Logging                             --
------------------------------------------------------------------------

-- The level of logging.
-- Possible values: "trace", "debug", "info", "warn", "error", "fatal"
dvim.log.level = "trace"
-- The file to log to. Default is ~/.cache/dvim/dvim.log
dvim.log.out_file = get_cache_dir() .. "/dvim.log"

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
dvim.builtin.plugins.todo_comments.active = true
dvim.builtin.plugins.terminal.active = true
dvim.builtin.plugins.dap.active = true
dvim.builtin.plugins.ultisnips.active = true
dvim.builtin.plugins.telescope.active = true
dvim.builtin.plugins.project.active = true
dvim.builtin.plugins.copilot.active = true
dvim.builtin.plugins.cmp.active = true
dvim.builtin.plugins.autopairs.active = true
dvim.builtin.plugins.nvimtree.active = true
dvim.builtin.plugins.lualine.active = true
dvim.builtin.plugins.staline.active = true
dvim.builtin.plugins.bufferline.active = true
dvim.builtin.plugins.notify.active = true
dvim.builtin.plugins.treesitter.active = true
dvim.builtin.plugins.folds.active = true

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
dvim.builtin.filetypes.lua.active = true
dvim.builtin.filetypes.vim.active = true
dvim.builtin.filetypes.python.active = true
dvim.builtin.filetypes.cpp.active = true
dvim.builtin.filetypes.cmake.active = true
dvim.builtin.filetypes.c.active = true
dvim.builtin.filetypes.c_sharp.active = true
dvim.builtin.filetypes.sql.active = true
dvim.builtin.filetypes.html.active = true
dvim.builtin.filetypes.css.active = true
dvim.builtin.filetypes.javascript.active = true
dvim.builtin.filetypes.typescript.active = true
dvim.builtin.filetypes.php.active = true
dvim.builtin.filetypes.ruby.active = true
dvim.builtin.filetypes.perl.active = true
dvim.builtin.filetypes.java.active = true
dvim.builtin.filetypes.rust.active = true
dvim.builtin.filetypes.solidity.active = true
dvim.builtin.filetypes.go.active = true
dvim.builtin.filetypes.bash.active = true
dvim.builtin.filetypes.log.active = true
dvim.builtin.filetypes.latex.active = true
dvim.builtin.filetypes.markdown.active = true
dvim.builtin.filetypes.yaml.active = true
dvim.builtin.filetypes.json.active = true
dvim.builtin.filetypes.toml.active = true
dvim.builtin.filetypes.tmux.active = true

-----------------------
--  Builtin Actions  --
-----------------------

dvim.builtin.actions.writing.active = true
dvim.builtin.actions.note_taking.active = true
dvim.builtin.actions.programming.active = true
dvim.builtin.actions.presentation.active = true
dvim.builtin.actions.documentation.active = true

------------------------------------------------------------------------
--                            Keymappings                             --
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
--  Remove Keymappings  --
--------------------------

-- Ctrl+a highlights everything
dvim.keys.normal_mode["<C-a>"] = ""

--------------------------
--  Which Key Bindings  --
--------------------------

-- Ignore this. If you remove this, then a whole ton of shit starts to happen
-- and this is the easiest way to fix it.
dvim.builtin.plugins.which_key.user_vmappings = {}
dvim.builtin.plugins.which_key.user_mappings = {}

dvim.builtin.plugins.which_key.user_vmappings = {}
dvim.builtin.plugins.which_key.user_mappings["r"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
}

------------------------------------------------------------------------
--                         Modifying Plugins                          --
------------------------------------------------------------------------

------------------
--  Statusline  --
------------------

-- Possible values: "staline", "lualine"
dvim.statusline = "lualine"
-- Possible values: "evil", "normal", "pebble", "simple", "simpler"
dvim.builtin.plugins.staline.mode = "evil"
-- Possible values: "evil", "bubbles", "slanted"
dvim.builtin.plugins.lualine.theme = "pywal" -- https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md
dvim.builtin.plugins.lualine.mode = "evil"

-----------------
--  Telescope  --
-----------------

-- Extensions
dvim.builtin.plugins.telescope.extensions.active = true
dvim.builtin.plugins.telescope.extensions.file_browser.active = true
dvim.builtin.plugins.telescope.extensions.project.active = true
dvim.builtin.plugins.telescope.extensions.notify.active = true
dvim.builtin.plugins.telescope.extensions.media_files.active = true
dvim.builtin.plugins.telescope.extensions.vim_bookmarks.active = true
dvim.builtin.plugins.telescope.extensions.symbols.active = true

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
    "sql",
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
dvim.builtin.plugins.which_key.presets.operators = true
dvim.builtin.plugins.which_key.presets.motions = true
dvim.builtin.plugins.which_key.presets.text_objects = true
dvim.builtin.plugins.which_key.presets.nav = true
dvim.builtin.plugins.which_key.presets.z = true
dvim.builtin.plugins.which_key.presets.g = true
dvim.builtin.plugins.which_key.spelling.enabled = true
dvim.builtin.plugins.which_key.spelling.suggestions = 20

-----------------
--  Git Signs  --
-----------------

-- Show the git commit message on the line
dvim.builtin.plugins.gitsigns.line_blame = true

------------------------------------------------------------------------
--                                LSP                                 --
------------------------------------------------------------------------

-------------
-- General --
-------------

dvim.lsp.active = true

-----------------
--  Lsp Lines  --
-----------------

dvim.lsp.lsp_lines = false

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
--                    Individual Filetype Settings                    --
------------------------------------------------------------------------

-- Here is where you put each speific settings for each filetype.

dvim.builtin.filetypes.latex.settings = {
  wrap = true,
  spell = true,
}

dvim.builtin.filetypes.markdown.settings = {
  wrap = true,
  spell = true,
}

------------------------------------------------------------------------
--                         Additional Plugins                         --
------------------------------------------------------------------------

-- Add any additional plugins you may want
dvim.plugins = {
  "folke/trouble.nvim",
  "tjdevries/express_line.nvim",
}

------------------------------------------------------------------------
--                           Auto Commands                            --
------------------------------------------------------------------------

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
