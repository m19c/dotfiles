local configs = require("plugins.configs.lspconfig")
local util = require("lspconfig/util")
local on_attach = configs.on_attach
local capabilities = configs.capabilities

local lspconfig = require("lspconfig")

-- attach gopls to every directory containing a *.go file, go.mod and so on...
lspconfig.gopls.setup({
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_dir = util.root_pattern("go.work", "go.mod", ".git"),
	settings = {
		gopls = {
			completeUnimported = true,
			usePlaceholders = true,
			analyses = {
				unusedparams = true,
			},
		},
	},
})

lspconfig.graphql.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	root_dir = lspconfig.util.root_pattern(".graphqlconfig", ".graphqlrc", "package.json", "schema.graphql"),
	flags = {
		debounce_text_changes = 150,
	},
})

lspconfig.astro.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	configuration = {},
	typescript = {},
})

local unconfigured_language_servers = { "ts_ls", "tailwindcss", "eslint", "html", "cssls", "terraformls" }
for _, uls in ipairs(unconfigured_language_servers) do
	lspconfig[uls].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end
