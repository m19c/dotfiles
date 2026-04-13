local plugins = {
    {
        "smoka7/multicursors.nvim",
        event = "VeryLazy",
        dependencies = {
            "nvimtools/hydra.nvim",
        },
        opts = {},
        cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
        keys = {
            {
                mode = { "v", "n" },
                "<Leader>m",
                "<cmd>MCstart<cr>",
                desc = "Create a selection for selected text or word under the cursor",
            },
        },
    },
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
    },
    {
        "mbbill/undotree",
    },
    {
        "github/copilot.vim",
        lazy = false,
        config = function() -- Mapping tab is already used by NvChad
            vim.g.copilot_no_tab_map = true
            vim.g.copilot_assume_mapped = true
            vim.g.copilot_tab_fallback = ""
            -- The mapping is set to other key, see custom/lua/mappings
            -- or run <leader>ch to see copilot mapping section
        end,
    },
    {
        "christoomey/vim-tmux-navigator",
        lazy = false,
    },
    {
        "nvimtools/none-ls.nvim",
        event = "VeryLazy",
        opts = function()
            return require("custom.configs.null-ls")
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "nvimtools/none-ls.nvim",
        },
        config = function()
            require("nvchad.configs.lspconfig").defaults()
            require("custom.configs.lspconfig")
        end,
    },
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "prettierd",
                "tailwindcss-language-server",
                "lua-language-server",
                "kotlin-language-server",
                "pyright",
                "eslint-lsp",
                "html-lsp",
                -- "prettier",
                -- "ts_ls",
                "stylua",
                "gopls",
                "rust-analyzer",
                "typescript-language-server",
                "dockerfile-language-server",
                "graphql-language-service-cli",
                "astro-language-server",
                "yaml-language-server",

                -- databases
                "postgrestools",

                -- terraform ecosystem
                "terraform-ls",
                "tflint",
            },
        },
    },
    {
        "mfussenegger/nvim-dap",
        init = function() end,
    },
    {
        "dreamsofcode-io/nvim-dap-go",
        ft = "go",
        dependencies = "mfussenegger/nvim-dap",
        config = function(_, opts)
            require("dap-go").setup(opts)
        end,
    },
    {
        "olexsmir/gopher.nvim",
        ft = "go",
        config = function(_, opts)
            require("gopher").setup(opts)
        end,
        build = function()
            vim.cmd([[silent! GoInstallDeps]])
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                -- defaults
                "vim",
                "lua",

                -- web dev
                "html",
                "css",
                "javascript",
                "typescript",
                "tsx",
                "json",
                "vue",
                "svelte",
                "astro",
                -- "php",
                -- "phpdoc",
                "scss",
                "graphql",

                -- low level
                "c",
                "zig",
                "rust",
                "go",
                "gomod",
                "gosum",

                -- other
                "git_config",
                "git_rebase",
                "comment",
                "csv",
                "dockerfile",
                "dot",
                "jq",
                "jsdoc",
                "make",
                "sql",
                "xml",
                "terraform",
                "kotlin",
            },
        },
    },
    {
        "rust-lang/rust.vim",
        ft = "rust",
        init = function()
            vim.g.rustfmt_autosave = 1
        end,
    },
    {
        "simrat39/rust-tools.nvim",
        ft = "rust",
        dependencies = "neovim/nvim-lspconfig",
        opts = function()
            return require("custom.configs.rust-tools")
        end,
        config = function(_, opts)
            require("rust-tools").setup(opts)
        end,
    },
    {
        "mfussenegger/nvim-dap",
    },
    {
        "saecki/crates.nvim",
        ft = { "rust", "toml" },
        dependencies = "hrsh7th/nvim-cmp",
        config = function(_, opts)
            local crates = require("crates")
            crates.setup(opts)
            crates.show()
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        opts = function()
            local cmp = require("cmp")

            return {
                mapping = {
                    ["<CR>"] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Insert,
                        -- when true, auto-selects the first item if nothing was selected,
                        -- making noselect below not take effect.
                        select = false,
                    }),
                    ["<C-Space>"] = cmp.mapping.complete(),
                },
                -- adding noselect compared to default, to prevent autocomplete when typing,
                -- and this is actually nvim-cmp defaults, but NvChad overrides this.
                completion = {
                    completeopt = "menu,menuone,noselect",
                },
                -- for LSPs that (re)enable this:
                preselect = cmp.PreselectMode.None,
            }
        end,
    },
    {
        "windwp/nvim-ts-autotag",
        ft = {
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "html",
        },
        config = function()
            require("nvim-ts-autotag").setup()
        end,
    },
}

return plugins
