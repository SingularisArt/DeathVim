local null_status, null = pcall(require, "null-ls")
if not null_status then
	vim.notify("Please Install 'null-ls'")
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null.builtins.diagnostics

null.setup({
  debug = false,
  sources = {
    -- Formatters
    formatting.black.with({ extra_args = { "--fast" } }),
    formatting.stylua,
    formatting.latexindent,
    formatting.clang_format,
    formatting.cmake_format,
    formatting.json_tool,
    formatting.markdownlint,
    formatting.sqlformat,

    -- Diagnostics
    diagnostics.flake8,
  },
})
