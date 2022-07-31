local M = {}

M.config = function()
  local icons = require("dvim.core.icons")
  dvim.lsp.mason = {
    setup = {
      ui = {
        border = "rounded",
        icons = {
          package_installed = icons.lsp.server_installed,
          package_pending = icons.lsp.server_pending,
          package_uninstalled = icons.lsp.server_uninstalled,
        },
      },
      log_level = vim.log.levels.INFO,
      max_concurrent_installers = 5,
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

  opts = {
    on_attach = require("dvim.lsp.handlers").on_attach,
    capabilities = require("dvim.lsp.handlers").capabilities,
  }

  for server, _ in pairs(servers) do
    if server == "sumneko_lua" then
      opts.settings = {
        Lua = {
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { "vim", "dvim", "use" },
          },
        },
      }
    end

    lspconfig[server].setup(opts)
  end
end

return M
