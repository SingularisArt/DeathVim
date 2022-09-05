-- For more indepth explanation, please see:
-- https://github.com/SingularisArt/DeathVim/wiki/more-in-depth-look-into-the-config.lua-file

------------------------------------------------------------------------
--                              General                               --
------------------------------------------------------------------------

dvim.color.name = "base16-bright"
dvim.color.dark = true
dvim.color.light = not dvim.color.dark -- Don't mess with this
dvim.focus = true
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
--                              Builtin                               --
------------------------------------------------------------------------

-----------------------
--  Builtin Plugins  --
-----------------------

-- After changing plugin config exit and reopen DeathVim, then
-- Run :PackerSync to reload the plugins.
dvim.builtin.plugins.indent_blankline.active = true
dvim.builtin.plugins.colors.active = true
dvim.builtin.plugins.symbols_outline.active = true
dvim.builtin.plugins.which_key.active = true
dvim.builtin.plugins.gitsigns.active = true
dvim.builtin.plugins.comment.active = true
dvim.builtin.plugins.dap.active = true
dvim.builtin.plugins.ultisnips.active = true
dvim.builtin.plugins.telescope.active = true
dvim.builtin.plugins.project.active = true
dvim.builtin.plugins.cmp.active = true
dvim.builtin.plugins.autopairs.active = true
dvim.builtin.plugins.treesitter.active = true
dvim.builtin.plugins.neogen.active = true

-------------------------
--  Builtin Filetypes  --
-------------------------

-- This is an important list. If you disable a filetype, DeathVim will disable
-- the following for you:
--  It's LSP
--  It's formatter
--  It's linter
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
dvim.builtin.filetypes.hugo.active = true
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

------------------------------------------------------------------------
--                         Modifying Plugins                          --
------------------------------------------------------------------------

---------
-- CMP --
---------

dvim.builtin.plugins.cmp.extensions.active = true
dvim.builtin.plugins.cmp.extensions.nvim_lsp.active = true
dvim.builtin.plugins.cmp.extensions.nvim_lua.active = true
dvim.builtin.plugins.cmp.extensions.cmp_tabnine.active = true
dvim.builtin.plugins.cmp.extensions.latex_symbols.active = true
dvim.builtin.plugins.cmp.extensions.ultisnips.active = true
dvim.builtin.plugins.cmp.extensions.calc.active = true
dvim.builtin.plugins.cmp.extensions.path.active = true
dvim.builtin.plugins.cmp.extensions.buffer.active = true
dvim.builtin.plugins.cmp.extensions.emails.active = true
dvim.builtin.plugins.cmp.extensions.emoji.active = true
dvim.builtin.plugins.cmp.extensions.gh_issues.active = true

-------------------
-- File Browsers --
-------------------

-- Possible values: "dirvish", "nvim-tree", "nerd-tree"
dvim.file_browser = "nvim-tree"

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

dvim.builtin.plugins.treesitter.ensure_installed = {
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
}
dvim.builtin.plugins.treesitter.ignore_install = {
  "markdown",
  "latex",
}
dvim.builtin.plugins.treesitter.highlight.enable = true
dvim.builtin.plugins.treesitter.highlight.additional_vim_regex_highlighting = false
dvim.builtin.plugins.treesitter.highlight.disable = {
  "markdown",
  "latex",
}
dvim.builtin.plugins.treesitter.autopairs.enable = true
dvim.builtin.plugins.treesitter.autopairs.disable = {
  "markdown",
  "latex",
}
dvim.builtin.plugins.treesitter.context_commentstring.enable = true
dvim.builtin.plugins.treesitter.context_commentstring.enable_autocmd = false
dvim.builtin.plugins.treesitter.indent.enable = true
dvim.builtin.plugins.treesitter.indent.disable = {
  "markdown",
  "latex",
}

dvim.builtin.plugins.treesitter.autotag.enable = true

dvim.builtin.plugins.treesitter.textobjects.swap.enable = true
dvim.builtin.plugins.treesitter.textobjects.select.enable = true
dvim.builtin.plugins.treesitter.textobjects.move.enable = true
dvim.builtin.plugins.treesitter.textobjects.move.set_jumps = true

dvim.builtin.plugins.treesitter.textsubjects.enable = true

dvim.builtin.plugins.treesitter.playground.enable = true
dvim.builtin.plugins.treesitter.playground.disable = {
  "",
}

dvim.builtin.plugins.treesitter.rainbow.enable = true
dvim.builtin.plugins.treesitter.rainbow.extended_mode = true
dvim.builtin.plugins.treesitter.rainbow.max_file_lines = 1000
dvim.builtin.plugins.treesitter.rainbow.disable = {
  "html",
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
dvim.builtin.plugins.which_key.layout.align = "center"
-- Possible values: "none", "single", "double", "shadow"
dvim.builtin.plugins.which_key.window.border = "single"
-- Possible values: "bottom", "top"
dvim.builtin.plugins.which_key.window.position = "bottom"

-----------------
--  Git Signs  --
-----------------

-- Show the git commit message on the line
dvim.builtin.plugins.gitsigns.line_blame = true

--------------
--  Colors  --
--------------

-- Possible values: "background", "foreground", "single"
dvim.builtin.plugins.colors.document_highlight.mode = "background"

------------------------------------------------------------------------
--                                LSP                                 --
------------------------------------------------------------------------

-------------
-- General --
-------------

dvim.lsp.active = true
dvim.lsp.illuminate = true
dvim.lsp.inlay_hints = true
dvim.lsp.lsp_lines = false

------------------------
--  Language Servers  --
------------------------

-- This list depends on the filetypes list. Don't remove any of the items. Only
-- add new ones and if you want to disable a filetype, set it to false in the
-- filetypes list from above.
dvim.lsp.language_servers = {
  { server = "sumneko_lua", filetype = "lua" },
  -- { server = "vimls", filetype = "vim" },
  { server = "texlab", filetype = "latex" },
  { server = "pylsp", filetype = "python" },
  { server = "bashls", filetype = "bash" },
  -- { server = "clangd", filetype = "cpp" },
  -- { server = "cmake", filetype = "cmake" },
  { server = "html", filetype = "html" },
  { server = "emmet_ls", filetype = "html" },
  { server = "cssls", filetype = "css" },
  { server = "tailwindcss", filetype = "css" },
  { server = "jsonls", filetype = "json" },
  -- { server = "rust_analyzer", filetype = "rust" },
  -- { server = "solang", filetype = "solidity" },
  -- { server = "solc", filetype = "solidity" },
  -- { server = "golangci_lint_ls", filetype = "go" },
  { server = "tsserver", filetype = "javascript" },
  -- { server = "jdtls", filetype = "java" },
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
  -- {
  --   formatter = "clang_format",
  --   filetype = "cpp",
  -- },
  {
    formatter = "prettier",
    extra_args = { "--single-quote", "--jsx-single-quote" },
    filetype = "javascript",
  },
  -- {
  --   formatter = "rustfmt",
  --   filetype = "rust",
  -- },
  -- {
  --   formatter = "sql_formatter",
  --   filetype = "sql",
  -- },
  -- {
  --   formatter = "standardrb",
  --   extra_args = { "--fix", "--format", "quiet", "--stderr", "--stdin", "$FILENAME" },
  --   filetype = "ruby",
  -- },
  {
    formatter = "stylua",
    filetype = "lua",
  },
  -- {
  --   formatter = "google_java_format",
  --   filetype = "java",
  -- },
  {
    formatter = "shellharden",
    filetype = "bash",
  },
}

-- If you don't have a formatter installed for a filetype, DeathVim will try to
-- install it for you, but it isn't perfect. Always check the log file
-- (~/.config/dvim/log.log) to see if it succeded or failed.
dvim.lsp.automatic_formatters_installation = true

-------------
-- Linters --
-------------

-- This list depends on the filetypes list. Don't remove any of the items. Only
-- add new ones and if you want to disable a filetype, set it to false in the
-- filetypes list from above.
dvim.lsp.linters = {
  {
    linter = "flake8",
    filetype = "python",
  },
  -- {
  --   linter = "cppcheck",
  --   filetype = "cpp",
  -- },
}

-- If you don't have a linter installed for a filetype, DeathVim will try
-- to install it for you, but it isn't perfect. Always check the log file
-- (~/.config/dvim/log.log) to see if it succeded or failed.
dvim.lsp.automatic_linters_installation = true

-----------------
-- Code Action --
-----------------

dvim.lsp.code_actions = {
  { code_action = "gitsigns" },
  { code_action = "gitrebase" },
}

------------------------------------------------------------------------
--                    Individual Filetype Settings                    --
------------------------------------------------------------------------

-- Here is where you put each speific settings for each filetype.
dvim.builtin.filetypes.latex.settings = {
  wrap = true,
  textwidth = 80,
  spell = true,
}

dvim.builtin.filetypes.markdown.settings = {
  textwidth = 80,
  wrap = true,
  spell = true,
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

-- let treesitter use bash highlight for zsh files as well
vim.api.nvim_create_autocmd("FileType", {
  pattern = "zsh",
  callback = function()
    require("nvim-treesitter.highlight").attach(0, "bash")
  end,
})

------------------------------------------------------------------------
--                            Vim Commands                            --
------------------------------------------------------------------------

vim.cmd("set rtp+=~/Documents/school-notes/current-course")
