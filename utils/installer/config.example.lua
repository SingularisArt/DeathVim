dvim = {}

------------------------------------------------------------------------
--                              General                               --
------------------------------------------------------------------------

dvim.colorscheme = "wal"
dvim.autosave = true
dvim.log_level = "warn"
dvim.leader = "space"

------------------------------------------------------------------------
--                         TODO: Keymappings                          --
------------------------------------------------------------------------

dvim.leader = "space"

------------------------------------------------------------------------
--                                LSP                                 --
------------------------------------------------------------------------

local null = Utils.safe_require("null-ls")

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

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null.builtins.diagnostics

null.setup({
  debug = false,
  sources = {
    ------------------
    --  Formatters  --
    ------------------
    formatting.black, -- Python
    formatting.clang_format, -- C++,C
    formatting.latexindent, -- LaTeX
    formatting.prettier, -- Javascript/Typescript
    formatting.rustfmt, -- Rust
    formatting.sql_formatter, -- Sql
    formatting.standardrb, -- Ruby
    formatting.stylua, -- Lua
    formatting.google_java_format, -- Java
    formatting.shellharden, -- Bash

    -------------------
    --  Diagnostics  --
    -------------------
    diagnostics.luacheck, -- Lua
    diagnostics.vint, -- Vim
    diagnostics.flake8, -- Python
    diagnostics.cppcheck, -- C++,C
    diagnostics.shellcheck, -- Bash
  }
})

return dvim
