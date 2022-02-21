-- LSP Servers to install

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local langservers = {
  'sumneko_lua',      -- Lua
  'vimls',            -- Vim
  'texlab',           -- LaTeX
  'pylsp',            -- Python
  'bashls',           -- Bash
  'clangd',           -- C++,C
  'omnisharp',        -- C#
  'cmake',            -- CMake
  'html',             -- HTML
  'cssls',            -- CSS
  'jsonls',           -- JSON
  'rust_analyzer',    -- Rust
  'tsserver',         -- Typescript/Javascript
  'yamlls',           -- Yaml
  'solc',             -- Solidity
  'solang',           -- Solidity
  'solidity_ls',      -- Solidity
  'dockerls',         -- Docker
}

for _, server in ipairs(langservers) do
  if server == 'sumneko_lua' then
    require('lspconfig')[server].setup {
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim', 'use' }
          },
        }
      }
    }
  else
    require('lspconfig')[server].setup { capabilities = capabilities }
  end
end

