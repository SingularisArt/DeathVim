-- local M = {}

-- M.capabilities = vim.lsp.protocol.make_client_capabilities()

-- local cmp_nvim_lsp = require_clean("cmp_nvim_lsp")

-- M.capabilities.textDocument.completion.completionItem.snippetSupport = true
-- M.capabilities = cmp_nvim_lsp.update_capabilities(M.capabilities)

-- M.setup = function()
-- 	local icons = require("dvim.core.icons")
-- 	local signs = {

-- 		{ name = "DiagnosticSignError", text = icons.diagnostics.Error },
-- 		{ name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
-- 		{ name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
-- 		{ name = "DiagnosticSignInfo", text = icons.diagnostics.Information },
-- 	}

-- 	for _, sign in ipairs(signs) do
-- 		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
-- 	end

-- 	local config = {
-- 		-- disable virtual text
-- 		virtual_lines = false,
-- 		virtual_text = false,
-- 		-- virtual_text = {
-- 		--   -- spacing = 7,
-- 		--   -- update_in_insert = false,
-- 		--   -- severity_sort = true,
-- 		--   -- prefix = "<-",
-- 		--   prefix = " ●",
-- 		--   source = "if_many", -- Or "always"
-- 		--   -- format = function(diag)
-- 		--   --   return diag.message .. "blah"
-- 		--   -- end,
-- 		-- },

-- 		-- show signs
-- 		signs = {
-- 			active = signs,
-- 		},
-- 		update_in_insert = true,
-- 		underline = true,
-- 		severity_sort = true,
-- 		float = {
-- 			focusable = true,
-- 			style = "minimal",
-- 			border = "rounded",
-- 			-- border = {"▄","▄","▄","█","▀","▀","▀","█"},
-- 			source = "if_many", -- Or "always"
-- 			header = "",
-- 			prefix = "",
-- 			-- width = 40,
-- 		},
-- 	}

-- 	vim.diagnostic.config(config)

-- 	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
-- 		border = "rounded",
-- 		-- width = 60,
-- 		-- height = 30,
-- 	})

-- 	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
-- 		border = "rounded",
-- 		-- width = 60,
-- 		-- height = 30,
-- 	})
-- end

-- local function lsp_highlight_document(client)
-- 	-- if client.server_capabilities.document_highlight then
-- 	local illuminate = require_clean("illuminate")
-- 	illuminate.on_attach(client)
-- 	-- end
-- end

-- local function attach_navic(client, bufnr)
-- 	vim.g.navic_silence = true

-- 	local navic = require_clean("nvim-navic")

-- 	navic.attach(client, bufnr)
-- end

-- M.on_attach = function(client, bufnr)
-- 	lsp_highlight_document(client)
-- 	attach_navic(client, bufnr)

-- 	require("lsp-inlayhints").on_attach(bufnr, client)
-- end

-- vim.cmd([[ command! LspToggleAutoFormat execute 'lua require("dvim.lsp.handlers").toggle_format_on_save()' ]])

-- return M

local M = {}

M.capabilities = vim.lsp.protocol.make_client_capabilities()

local cmp_nvim_lsp = require_clean("cmp_nvim_lsp")

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
    -- virtual_text = {
    --   spacing = 7,
    --   update_in_insert = false,
    --   severity_sort = true,
    --   -- prefix = "<-",
    --   prefix = " ●",
    --   source = "if_many", -- Or "always"
    --   format = function(diag)
    --     return diag.message .. "blah"
    --   end,
    -- },

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
      -- border = {"▄","▄","▄","█","▀","▀","▀","█"},
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
    -- height = 30,
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
    -- width = 60,
    -- height = 30,
  })
end

local function lsp_highlight_document(client)
  local illuminate = require_clean("illuminate")
  illuminate.on_attach(client)
  -- end
end

local function attach_navic(client, bufnr)
  vim.g.navic_silence = true
  local navic = require_clean("nvim-navic")
  navic.attach(client, bufnr)
end

M.on_attach = function(client, bufnr)
  lsp_highlight_document(client)
  attach_navic(client, bufnr)
  require("lsp-inlayhints").on_attach(bufnr, client)
end

return M
