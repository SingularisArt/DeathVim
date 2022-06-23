require("dvim.settings.defaults")

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
--                           Builtin Plugins                          --
------------------------------------------------------------------------

-- After changing plugin config exit and reopen DeathVim, then
-- Run :PackerSync
dvim.builtin.alpha.active = true
dvim.builtin.alpha.mode = "dashboard"
dvim.builtin.autopairs.active = true
dvim.builtin.bufferline.active = true
dvim.builtin.cmp.active = true
dvim.builtin.dap.active = true
dvim.builtin.symbols_outline.active = true
dvim.builtin.todo_comments.active = true
dvim.builtin.gitsigns.active = true
dvim.builtin.comment.active = true
dvim.builtin.jabs.active = true
dvim.builtin.surround.active = true
dvim.builtin.comments.active = true
dvim.builtin.lualine.active = true
dvim.builtin.markdown.active = true
dvim.builtin.nvimtree.active = true
dvim.builtin.telescope.active = true
dvim.builtin.project.active = true
dvim.builtin.terminal.active = true
dvim.builtin.ultisnips.active = true
dvim.builtin.vimtex.active = true
dvim.builtin.which_key.active = true
dvim.builtin.winbar.active = true
dvim.builtin.notify.active = true

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

-- -- dvim.lsp.automatic_servers_installation = true

----------------
-- Formatters --
----------------

-- local formatters = Utils.safe_require("dvim.lsp.null-ls.formatters")
-- formatters.setup({
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
-- })

-------------
-- Linters --
-------------

-- local diagnostics = Utils.safe_require("dvim.lsp.null-ls.diagnostics")
-- diagnostics.setup({
--   { command = "flake8" },
--   { command = "cppcheck" },
-- })

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

-- -- Autocommands (https://neovim.io/doc/user/autocmd.html)
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

vim.api.nvim_create_autocmd("CursorMoved", "BufWinEnter", "BufFilePost", "InsertEnter", "BufWritePost", {
  callback = function()
    if vim.bo.filetype ~= "tex" then
      require("dvim.core.winbar").setup()
    end
  end
})

------------------------------------------------------------------------
--                            Vim Commands                            --
------------------------------------------------------------------------

-- vim.cmd("set rtp+=~/Documents/notes/school-notes/current-course")

return M
