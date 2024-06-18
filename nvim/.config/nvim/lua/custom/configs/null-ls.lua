local null_ls = require "null-ls"

local formatting = null_ls.builtins.formatting

local sources = {
  null_ls.builtins.formatting.prettierd,
  formatting.prettierd.with {
    extra_args = { "--single-quote" },
  },
  formatting.prettierd.with {
    extra_filetypes = { "astro" },
  },
  formatting.stylua,
  formatting.gofumpt,
  formatting.goimports_reviser,
  formatting.golines,
}

null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds {
        group = augroup,
        buffer = bufnr,
      }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
}
