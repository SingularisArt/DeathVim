local M = {}

M.config = function()
  dvim.lsp.mason = {
    setup = {
      ui = {
        border = "rounded",
        icons = {
          package_installed = "◍",
          package_pending = "◍",
          package_uninstalled = "◍",
        },
      },
      log_level = vim.log.levels.INFO,
      max_concurrent_installers = 4,
    },
  }
end

M.setup = function(ensure_installed, servers)
  M.config()

  local mason = require_clean("mason")
  local mason_lspconfig = require_clean("mason-lspconfig")

  mason.setup(dvim.lsp.mason.setup)
  mason_lspconfig.setup({
    ensure_installed = ensure_installed,
    automatic_installation = true,
  })

  local lspconfig = require_clean("lspconfig")

  local opts = {}

  for server, _ in pairs(servers) do
    opts = {
      on_attach = require("dvim.lsp.handlers").on_attach,
      capabilities = require("dvim.lsp.handlers").capabilities,
    }

    server = vim.split(server, "@")[1]

    lspconfig[server].setup(opts)
  end
end

return M
