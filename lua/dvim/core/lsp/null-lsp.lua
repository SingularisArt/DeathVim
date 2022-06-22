local null = Utils.safe_require("null-ls")

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null.builtins.diagnostics

null.setup({
  debug = false,
  sources = {
    -- Formatters
    dvim.formatters,
    -- formatting.black.with({ extra_args = { "--fast" } }), -- Python
    -- formatting.clang_format, -- C++, C, C#, Java, Cuda
    -- formatting.latexindent, -- LaTeX
    -- formatting.prettier.with({ extra_args = { "--single-quote", "--jsx-single-quote" } }), -- Javascript, Javascriptreact, Typescript, Typescriptreact, Vue, Css, Scss, Less, Html, Json, Jsonc, Yaml, Markdown, Graphql, Handlebars
    -- formatting.rustfmt, -- Rust
    -- formatting.sql_formatter, -- SQL
    -- formatting.standardrb.with({ extra_args = { "--fix", "--format", "quiet", "--stderr", "--stdin", "$FILENAME" } }), -- Ruby
    -- formatting.stylua, -- Lua
    -- formatting.google_java_format, -- Java

    -- Diagnostics
    diagnostics.flake8, -- Python
    diagnostics.cppcheck, -- C++, C
  },
})
