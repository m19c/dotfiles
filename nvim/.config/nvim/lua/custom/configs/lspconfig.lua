local configs = require("nvchad.configs.lspconfig")
local on_attach = configs.on_attach
local capabilities = configs.capabilities

local function with_root(markers)
	return function(bufnr)
		return vim.fs.root(bufnr, markers)
	end
end

-- attach gopls to every directory containing a *.go file, go.mod and so on...
vim.lsp.config("gopls", {
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_dir = with_root({ "go.work", "go.mod", ".git" }),
	on_attach = on_attach,
	capabilities = capabilities,
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
vim.lsp.enable("gopls")

vim.lsp.config("graphql", {
	on_attach = on_attach,
	capabilities = capabilities,
	root_dir = with_root({ ".graphqlconfig", ".graphqlrc", "package.json", "schema.graphql" }),
	flags = {
		debounce_text_changes = 150,
	},
})
vim.lsp.enable("graphql")

vim.lsp.config("astro", {
	on_attach = on_attach,
	capabilities = capabilities,
	configuration = {},
	typescript = {},
})
vim.lsp.enable("astro")

vim.lsp.config("yamlls", {
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		yaml = {
			schemas = {
				kubernetes = "*.yaml",
				["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
				["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
				["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
				["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
				["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
				["http://json.schemastore.org/ansible-playbook"] = "*play*.{yml,yaml}",
				["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
				["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
				["https://json.schemastore.org/gitlab-ci"] = "*gitlab-ci*.{yml,yaml}",
				["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "*api*.{yml,yaml}",
				["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
				["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = "*flow*.{yml,yaml}",
			},
		},
	},
})
vim.lsp.enable("yamlls")

local unconfigured_language_servers = {
	"kotlin_language_server",
	"ts_ls",
	"tailwindcss",
	"eslint",
	"html",
	"cssls",
	"terraformls",
	"pyright",
	"postgrestools",
}
for _, uls in ipairs(unconfigured_language_servers) do
	vim.lsp.config(uls, {
		on_attach = on_attach,
		capabilities = capabilities,
	})
	vim.lsp.enable(uls)
end
