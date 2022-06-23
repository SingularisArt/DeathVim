----------------
-- Main Files --
----------------

local M = {}
local utils = require "dvim.utils"
local autocmds = require "dvim.autocmds"

-- dvim.lsp = Utils.safe_require("dvim.lsp.config")
-- Utils.safe_require("lspconfig")

-- Utils.safe_require("dvim.lsp.servers")
-- Utils.safe_require("dvim.lsp.lsp-signature")
-- Utils.safe_require("dvim.lsp.handlers").setup()

function M.common_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  }

  local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  if status_ok then
    capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
  end

  return capabilities
end

function M.common_on_exit(_, _)
  if dvim.lsp.document_highlight then
    autocmds.clear_augroup "lsp_document_highlight"
  end
  if dvim.lsp.code_lens_refresh then
    autocmds.clear_augroup "lsp_code_lens_refresh"
  end
end

function M.common_on_init(client, bufnr)
  if dvim.lsp.on_init_callback then
    dvim.lsp.on_init_callback(client, bufnr)
    return
  end
end

function M.common_on_attach(client, bufnr)
  if dvim.lsp.on_attach_callback then
    dvim.lsp.on_attach_callback(client, bufnr)
  end
  local lu = require "dvim.lsp.utils"
  if dvim.lsp.document_highlight then
    lu.setup_document_highlight(client, bufnr)
  end
  if dvim.lsp.code_lens_refresh then
    lu.setup_codelens_refresh(client, bufnr)
  end
end

local function bootstrap_nlsp(opts)
  opts = opts or {}
  local lsp_settings_status_ok, lsp_settings = pcall(require, "nlspsettings")
  if lsp_settings_status_ok then
    lsp_settings.setup(opts)
  end
end

function M.get_common_opts()
  return {
    on_attach = M.common_on_attach,
    on_init = M.common_on_init,
    on_exit = M.common_on_exit,
    capabilities = M.common_capabilities(),
  }
end

function M.setup()
  local lsp_status_ok, _ = pcall(require, "lspconfig")
  if not lsp_status_ok then
    return
  end

  if dvim.use_icons then
    for _, sign in ipairs(dvim.lsp.diagnostics.signs.values) do
      vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
    end
  end

  require("dvim.lsp.handlers").setup()

  bootstrap_nlsp {
    config_home = utils.join_paths(get_config_dir(), "lsp-settings"),
    append_default_schemas = true,
  }

  require("nvim-lsp-installer").setup {
    -- use the default nvim_data_dir, since the server binaries are independent
    install_root_dir = utils.join_paths(vim.call("stdpath", "data"), "lsp_servers"),
  }

  require("dvim.lsp.null-ls").setup()

  autocmds.configure_format_on_save()
end

M.setup()
return M
