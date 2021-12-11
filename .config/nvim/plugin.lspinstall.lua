require'lspinstall'.setup() -- important

require'lspinstall'.install_server('typescript')
require'lspinstall'.install_server('css')
require'lspinstall'.install_server('html')
require'lspinstall'.install_server('bash')
require'lspinstall'.install_server('lua')
require'lspinstall'.install_server('json')

local servers = require'lspinstall'.installed_servers()

for _, server in pairs(servers) do
  require'lspconfig'[server].setup{}
end
