local lsp = require("nvchad.configs.lspconfig")
local on_attach = lsp.on_attach
local capabilities = lsp.capabilities

local options = {
  server = {
    on_attach = on_attach,
    capabilities = capabilities,
  },
}

return options
