local M = {}

function M.setup(servers, options)
  local lspconfig = require("lspconfig")
  local icons = require("dvim.core.icons")

  -- nvim-lsp-installer must be set up before nvim-lspconfig
  require("nvim-lsp-installer").setup {
    ensure_installed = vim.tbl_keys(servers),
    automatic_installation = true,
    ui = {
      icons = {
        server_installed = icons.lsp.server_installed,
        server_pending = icons.lsp.server_pending,
        server_uninstalled = icons.lsp.server_uninstalled,
      },
    },
  }

  -- Set up LSP servers
  for server_name, _ in pairs(servers) do
    local opts = vim.tbl_deep_extend("force", options, servers[server_name] or {})

    -- if server_name == "sumneko_lua" then
    --   opts = require("lua-dev").setup { lspconfig = opts }
    -- end

    lspconfig[server_name].setup(opts)
  end
end

return M
