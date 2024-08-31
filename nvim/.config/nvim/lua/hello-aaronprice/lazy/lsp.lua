return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "VonHeikemen/lsp-zero.nvim", branch = "4.x",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
    },

    config = function()
        local lsp_zero = require('lsp-zero')

        lsp_zero.extend_lspconfig({
            sign_text = true,
            lsp_attach = _G.LspAttachAutoCmd
        })

        lsp_zero.ui({
            float_border = 'rounded',
            sign_text = {
              error = '✘',
              warn = '▲',
              hint = '⚑',
              info = '»',
          },
        })

        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")
        local cmp_select = { behavior = cmp.SelectBehavior.Select }
        local cmp_action = require("lsp-zero").cmp_action()
        local cmp_format = require("lsp-zero").cmp_format({details = true})

        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities()
        )
        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {'lua_ls', 'rust_analyzer', 'pyright', 'dockerls', 'docker_compose_language_service', 'gopls', 'terraformls', 'yamlls'},
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,
                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                runtime = { version = "Lua 5.1" },
                                diagnostics = {
                                    globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
                                }
                            }
                        }
                    }
                end,
            }
        })


        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            formatting = cmp_format,
            mapping = cmp.mapping.preset.insert({
                ['<Tab>'] = cmp_action.tab_complete(),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),

            }),
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
            }, {
                { name = 'buffer' },
            })
        })
        vim.diagnostic.config({
            -- update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end
}