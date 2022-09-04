local M = {}

local cmp_nvim_lsp = require_clean("cmp_nvim_lsp")

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.update_capabilities(M.capabilities)

M.setup = function()
  local icons = require("dvim.core.icons")
  local signs = {
    { name = "DiagnosticSignError", text = icons.diagnostics.Error },
    { name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
    { name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
    { name = "DiagnosticSignInfo", text = icons.diagnostics.Information },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    -- disable virtual text
    virtual_lines = false,
    virtual_text = false,
    -- show signs
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      source = "if_many", -- Or "always"
      header = "",
      prefix = "",
      -- width = 40,
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
    -- width = 60,
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
end

local function on_attach_illuminate(client, bufnr)
  if dvim.lsp.illuminate then
    require_clean("illuminate").on_attach(client, bufnr)
  end
end

local function on_attach_navic(client, bufnr)
  if dvim.builtin.plugins.winbar.active then
    require_clean("nvim-navic").on_attach(client, bufnr)
  end
end

local function on_attach_color(bufnr)
  if dvim.builtin.plugins.colors.active then
    require_clean("document-color").buf_attach(bufnr)
  end
end

local function on_attach_inlay_hints(client, bufnr)
  if dvim.lsp.inlay_hints then
    require_clean("lsp-inlayhints").on_attach(client, bufnr)
  end
end

M.on_attach = function(client, bufnr)
  on_attach_illuminate(client, bufnr)
  on_attach_navic(client, bufnr)
  on_attach_color(bufnr)
  on_attach_inlay_hints(client, bufnr)
end

return M
