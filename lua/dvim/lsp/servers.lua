local M = {}

local capabilities = Utils.safe_require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

local config = {
  virtual_text = false,
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
}

function M.toggle_server(server)
  if server == "sumneko_lua" then
    require("lspconfig")[server].setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim", "use", "dvim" },
          },
        },
      },
    })
  else
    Utils.safe_require("lspconfig")[server].setup({
      capabilities = capabilities,
    })
  end
end

M.setup = function()
  for _, server_object in ipairs(dvim.lsp.language_servers) do
    if pcall(function() return dvim.builtin.filetypes[server_object.filetype].active ~= nil end) then
      Log.trace("[LSP] Toggling server for filetype: " .. server_object.filetype .. " Server is: [" .. server_object.server .. "]")
      M.toggle_server(server_object.server)
    else
      Log.error("[LSP] Filetype: [" .. server_object.filetype .. "] not found in dvim.builtin.filetypes. Please look at the config.lua file.")
    end
  end

  Utils.safe_require("lsp_signature").setup({ hi_parameter = "IncSearch" })
  Utils.safe_require("goto-preview").setup({})
  vim.diagnostic.config(config)
end

M.setup()
return M
