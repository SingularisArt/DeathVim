require("dvim.settings.defaults")

------------------------------------------------------------------------
--                              General                               --
------------------------------------------------------------------------

dvim.colorscheme = "onedarker"
dvim.autosave = true
dvim.log_level = "warn"
dvim.leader = "space"

------------------------------------------------------------------------
--                         TODO: Keymappings                          --
------------------------------------------------------------------------

dvim.leader = "space"

------------------------------------------------------------------------
--                           Builtin Plugins                          --
------------------------------------------------------------------------

-- After changing plugin config exit and reopen DeathVim, then
-- Run :PackerInstall :PackerCompile
dvim.builtin.alpha.active = true
dvim.builtin.alpha.mode = "dashboard"
dvim.builtin.autopairs.active = true
dvim.builtin.bufferline.active = true
dvim.builtin.cmp.active = true
dvim.builtin.dap.active = true
dvim.builtin.lualine.active = true
dvim.builtin.markdown.active = true
dvim.builtin.chadtree.active = true
dvim.builtin.telescope.active = true
dvim.builtin.project.active = true
dvim.builtin.ultisnips.active = true
dvim.builtin.vimtex.active = true
dvim.builtin.which_key.active = true
dvim.builtin.winbar.active = true
dvim.builtin.notify.active = true

------------------------------------------------------------------------
--                                LSP                                 --
------------------------------------------------------------------------

local M = {}
M.user_lsp_config = function()
  ------------------------
  --  Language Servers  --
  ------------------------

  dvim.language_servers = {
    "sumneko_lua", -- Lua
    "vimls", -- Vim
    "texlab", -- LaTeX
    "pylsp", -- Python
    "bashls", -- Bash
    "clangd", -- C++,C
    "cmake", -- CMake
    "html", -- HTML
    "cssls", -- CSS
    "jsonls", -- JSON
    "rust_analyzer", -- Rust
    "tsserver", -- Typescript/Javascript
    "jdtls", -- Java
    "yamlls", -- Yaml
  }

  -- dvim.lsp.automatic_servers_installation = true

  -- set a formatter, this will override the language server formatting capabilities (if it exists)
  local formatters = require("dvim.lsp.null-ls.formatters")
  formatters.setup {
    { command = "black", extra_args = { "--fast" } },
    { command = "clang_format" },
    { command = "latexindent" },
    { command = "prettier", extra_args = { "--single-quote", "--jsx-single-quote" } },
    { command = "rustfmt" },
    { command = "sql_formatter" },
    { command = "standardrb", extra_args = { "--fix", "--format", "quiet", "--stderr", "--stdin", "$FILENAME" } },
    { command = "stylua" },
    { command = "google_java_format" },
    { command = "shellharden" },
  }

  -- set additional linters
  local diagnostics = require("dvim.lsp.null-ls.diagnostics")
  diagnostics.setup {
    { command = "flake8" },
    { command = "cppcheck" },
  }
end

return M
