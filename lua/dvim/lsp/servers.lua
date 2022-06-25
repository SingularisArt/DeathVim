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
  for _, object in ipairs(dvim.lsp.language_servers) do
    for key, element in pairs(object) do
      if key == "filetype" then
        if dvim.builtin.filetypes[element].active then
          Log.trace("[LSP] Toggling server for filetype: " .. element .. " Server is: [" .. object.server .. "]")
          M.toggle_server(object.server)
        end
      end
    end
  end

  Utils.safe_require("lsp_signature").setup({ hi_parameter = "IncSearch" })

  Utils.safe_require("goto-preview").setup({})

  vim.diagnostic.config(config)
end

return M
