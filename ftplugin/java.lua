local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

local config = {
  cmd = {
    'java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.level=ALL',
    '-noverify',
    '-Xmx1G',
    '-jar', vim.fn.expand('~/.config/nvim/lua/SingularisArt/lsp/servers/jdt-language-server/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar'),
    '-configuration',
    vim.fn.expand('~/.config/nvim/lua/SingularisArt/lsp/servers/jdt-language-server/config_linux/'),
    '-data',
    vim.fn.expand('~/.cache/jdtls-workspace') .. workspace_dir,
  },
  root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
  capabilities = capabilities,
}

require('jdtls').start_or_attach(config)
