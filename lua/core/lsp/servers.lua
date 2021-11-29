-- LSP Servers to install

local langservers = {
  'vimls',
  'texlab',
  'pylsp',
  'bashls',
  'clangd',
  'cmake',
  'rust_analyzer',
  'tsserver',
}

for _, server in ipairs(langservers) do
    require('lspconfig')[server].setup {}
end

